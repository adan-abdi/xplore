import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/cart_model.dart';
import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/components/show_snackbar.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../../feature_main/main_screen.dart';
import '../../../feature_merchant_store/domain/model/product_model.dart';
import '../../../feature_merchant_store/domain/model/transaction_model.dart';
import '../../../feature_merchant_store/domain/model/transaction_types.dart';
import '../../../feature_merchant_store/presentation/controller/merchant_controller.dart';
import '../../domain/model/payment_types.dart';
import '../controller/cart_controller.dart';

class MpesaPaymentSection extends StatefulWidget {
  final int total;

  const MpesaPaymentSection({super.key, required this.total});

  @override
  State<MpesaPaymentSection> createState() => _MpesaPaymentSectionState();
}

class _MpesaPaymentSectionState extends State<MpesaPaymentSection> {
  late final CartController _cartController;
  late final HomeController _homeController;
  late final MerchantController _merchantController;
  late final AuthController _authController;
  late final TextEditingController _phoneNumberController;
  String? buyerId = '';

  @override
  void initState() {
    super.initState();

    _phoneNumberController = TextEditingController();
    _cartController = Get.find<CartController>();
    _homeController = Get.find<HomeController>();
    _merchantController = Get.find<MerchantController>();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  title
          Row(
            children: [
              Image.asset('assets/general/mpesa_new.png', width: 50),
              hSize20SizedBox,
              Text("Lipa na M-Pesa",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),

          vSize20SizedBox,

          //  box to enter M-Pesa amount
          CustomTextField(
              hint: " Ksh. ${widget.total}",
              iconData: Icons.attach_money_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              isEnabled: false,
              onChanged: (value) {}),
          //  box to enter M-Pesa amount
          CustomTextField(
              hint: "Phone number",
              iconData: Icons.phone_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              controller: _phoneNumberController,
              onChanged: (value) {
                //  get buyer ID from phone number
                final buyerId = value.checkIsPhoneNumberValid
                    ? _homeController.stores
                        .firstWhere(
                            (user) =>
                                user.userPhoneNumber! == value.add254Prefix,
                            orElse: () => UserModel())
                        .userId
                    : null;

                setState(() {
                  this.buyerId = buyerId;
                });
              }),

          //  proceed button
          SubmitButton(
              iconData: Icons.done_rounded,
              text: 'Pay',
              isValid: true,
              onTap: () async {
                final items = _authController.user.value!.itemsInCart!;
                final timeStamp = DateTime.now();

                for (CartModel cartItem in items) {
                  {
                    //  get seller id & product id
                    final sellerId = _merchantController.merchantProducts
                        .firstWhere((product) =>
                            product.productId! == cartItem.cartProductId!)
                        .sellerId!;

                    final product = _merchantController.merchantProducts
                        .firstWhere((product) =>
                            product.productId! == cartItem.cartProductId!);

                    final sellerData = await _authController
                        .getSpecificUserFromFirestore(uid: sellerId);

                    final buyerData = buyerId == null || buyerId!.isEmpty
                        ? null
                        : await _authController.getSpecificUserFromFirestore(
                            uid: buyerId!);

                    final allTransactions = sellerData.transactions!;

                    allTransactions.add(TransactionModel(
                        buyerId: buyerId == null || buyerId!.isEmpty
                            ? 'customer ${allTransactions.length + 1} - $timeStamp'
                            : '${buyerId!} - $timeStamp',
                        product: _merchantController.merchantProducts
                            .firstWhere((product) =>
                                product.productId! == cartItem.cartProductId!),
                        itemsBought: cartItem.cartProductCount!,
                        amountPaid: widget.total,
                        transactionDate: DateTime.now().toString(),
                        isFulfilled: false,
                        transactionType: TransactionTypes.pending.toString(),
                        transactionPaymentMethod:
                            PaymentTypes.mpesa.toString()));

                    await _authController
                        .updateUserDataInFirestore(
                            oldUser: sellerData,
                            newUser: UserModel(transactions: allTransactions),
                            uid: sellerId,
                            response: (state, error) {})
                        .then((value) async {
                      //  update buyer data
                      if (buyerData != null && buyerId != null) {
                        final buyerTransactions = buyerData.transactions!;

                        buyerTransactions.add(TransactionModel(
                            buyerId: buyerId == null || buyerId!.isEmpty
                                ? _authController.user.value!.userId!
                                : '${buyerId!} - $timeStamp',
                            product: _merchantController.merchantProducts
                                .firstWhere((product) =>
                                    product.productId! ==
                                    cartItem.cartProductId!),
                            itemsBought: cartItem.cartProductCount!,
                            amountPaid: widget.total,
                            transactionDate: DateTime.now().toString(),
                            isFulfilled: false,
                            transactionType:
                                TransactionTypes.pending.toString(),
                            transactionPaymentMethod:
                                PaymentTypes.mpesa.toString()));

                        await _authController.updateUserDataInFirestore(
                            oldUser: buyerData,
                            newUser: UserModel(transactions: buyerTransactions),
                            uid: buyerId!,
                            response: (state, error) {});
                      }

                      //  update product stock count
                      await _merchantController.updateProduct(
                          oldProduct: product,
                          newProduct: ProductModel(
                              productStockCount: product.productStockCount! -
                                  cartItem.cartProductCount!),
                          response: (state) {});

                      //  clear all cart items
                      await _authController.updateUserDataInFirestore(
                          oldUser: _authController.user.value!,
                          newUser: UserModel(itemsInCart: []),
                          uid: _authController.user.value!.userId!,
                          response: (state, error) {});
                    });

                    //  go to home page
                    Get.offAll(MainScreen());
                  }
                }

                showSnackbar(
                    title: "Order confirmed!",
                    message: "Payment made successfully!",
                    iconData: Icons.attach_money_rounded,
                    iconColor: XploreColors.xploreOrange);
              }),
        ],
      ),
    );
  }
}

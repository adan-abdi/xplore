import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pinput/pinput.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';

import '../../../../application/core/themes/colors.dart';
import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../../feature_main/main_screen.dart';
import '../../../feature_merchant_store/domain/model/product_model.dart';
import '../../../feature_merchant_store/domain/model/transaction_model.dart';
import '../../../feature_merchant_store/domain/model/transaction_types.dart';
import '../../../feature_merchant_store/presentation/controller/merchant_controller.dart';
import '../controller/cart_controller.dart';

class CreditPaymentSection extends StatefulWidget {
  final int total;

  const CreditPaymentSection({super.key, required this.total});

  @override
  State<CreditPaymentSection> createState() => _CreditPaymentSectionState();
}

class _CreditPaymentSectionState extends State<CreditPaymentSection> {
  late final CartController _cartController;
  late final HomeController _homeController;
  late final MerchantController _merchantController;
  late final AuthController _authController;

  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _dateController;

  String? buyerId = '';
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();

    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _dateController = TextEditingController();

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
          Text("Credit Details",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize20SizedBox,

          CustomTextField(
              hint: "Full Name",
              iconData: Icons.person_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.text,
              controller: _fullNameController,
              onChanged: (value) {}),

          CustomTextField(
              hint: "Phone number",
              iconData: Icons.phone_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              controller: _phoneNumberController,
              onChanged: (value) {}),

          CustomTextField(
            hint: "Date for payment",
            iconData: Icons.calendar_month_rounded,
            textStyle: TextStyle(fontSize: 16),
            inputType: TextInputType.number,
            controller: _dateController,
            readOnly: true,
            showCursor: false,
            onChanged: (value) {},
            onTap: () async {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));

                setState(() {
                  date = pickedDate != null ? pickedDate : date;
                });

                _dateController.setText(date.toString().formatDate);
              });
            },
          ),

          //  proceed button
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: TextButton(
                onPressed: () async {
                  // update merchant transactions
                  _authController.user.value!.itemsInCart!
                      .forEach((cartItem) async {
                    //  get seller id & product id
                    final sellerId = _homeController.products
                        .firstWhere((product) =>
                            product.productId! == cartItem.cartProductId!)
                        .sellerId!;

                    final product = _homeController.products.firstWhere(
                        (product) =>
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
                            ? 'customer - ${Timestamp.now()}'
                            : buyerId!,
                        product: _merchantController.merchantProducts
                            .firstWhere((product) =>
                                product.productId! == cartItem.cartProductId!),
                        itemsBought: cartItem.cartProductCount!,
                        amountPaid: product.productSellingPrice! *
                            cartItem.cartProductCount!,
                        transactionDate: DateTime.now().toString(),
                        isFulfilled: false,
                        transactionType: TransactionTypes.credit.toString()));

                    _authController
                        .updateUserDataInFirestore(
                            oldUser: sellerData,
                            newUser: UserModel(transactions: allTransactions),
                            uid: sellerId)
                        .then((value) async {
                      //  update buyer data
                      if (buyerData != null && buyerId != null) {
                        final buyerTransactions = buyerData.transactions!;

                        buyerTransactions.add(TransactionModel(
                            buyerId: buyerId == null || buyerId!.isEmpty
                                ? _authController.user.value!.userId!
                                : buyerId!,
                            product: _merchantController.merchantProducts
                                .firstWhere((product) =>
                                    product.productId! ==
                                    cartItem.cartProductId!),
                            itemsBought: cartItem.cartProductCount!,
                            amountPaid: product.productSellingPrice! *
                                cartItem.cartProductCount!,
                            transactionDate: DateTime.now().toString(),
                            isFulfilled: true));

                        await _authController.updateUserDataInFirestore(
                            oldUser: buyerData,
                            newUser: UserModel(transactions: buyerTransactions),
                            uid: buyerId!);
                      }

                      //  update product stock count
                      _merchantController.updateProduct(
                          oldProduct: product,
                          newProduct: ProductModel(
                              productStockCount: product.productStockCount! -
                                  cartItem.cartProductCount!),
                          response: (state) {});

                      //  clear all cart items
                      _authController.updateUserDataInFirestore(
                          oldUser: _authController.user.value!,
                          newUser: UserModel(itemsInCart: []),
                          uid: _authController.user.value!.userId!);

                      //  go to home page
                      Get.offAll(MainScreen());
                    });
                  });
                },
                style: TextButton.styleFrom(
                    foregroundColor: XploreColors.xploreOrange),
                child: Text(
                  "Borrow on credit",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
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
import '../../../feature_merchant_store/presentation/controller/merchant_controller.dart';
import '../controller/cart_controller.dart';

class CashPaymentSection extends StatefulWidget {
  const CashPaymentSection({super.key});

  @override
  State<CashPaymentSection> createState() => _CashPaymentSectionState();
}

class _CashPaymentSectionState extends State<CashPaymentSection> {
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
          Text("Customer Details (optional)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

          vSize10SizedBox,

          Text("Enter customer phone number to send receipt.",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal)),

          vSize20SizedBox,

          //  customer phone number
          CustomTextField(
              hint: "Phone number",
              iconData: Icons.phone_rounded,
              textStyle: TextStyle(fontSize: 16),
              inputType: TextInputType.number,
              controller: _phoneNumberController,
              showErrorMessage: buyerId == null,
              errorMessage: "User not registered.",
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

                print("BUYER ID : - ${buyerId}");
              }),

          vSize20SizedBox,

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
                  "Confirm Order",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )),
          ),
        ],
      ),
    );
  }
}

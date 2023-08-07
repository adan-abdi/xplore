import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/show_snackbar.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

import '../../../../core/domain/model/response_state.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({super.key});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  late final TextEditingController _productNameController;
  late final TextEditingController _productUnitController;
  late final TextEditingController _productStockCountController;
  late final TextEditingController _productBuyingPriceController;
  late final TextEditingController _productSellingPriceController;
  late final TextEditingController _productCategoryController;
  late final MerchantController _merchantController;
  late final CoreController _coreController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController();
    _productUnitController = TextEditingController();
    _productStockCountController = TextEditingController();
    _productBuyingPriceController = TextEditingController();
    _productSellingPriceController = TextEditingController();
    _productCategoryController = TextEditingController();
    _coreController = Get.find<CoreController>();
    _authController = Get.find<AuthController>();
    _merchantController = Get.find<MerchantController>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 8,
          left: 16,
          right: 16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        color: XploreColors.white,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Center(
                        child: Text(
                      "Add Product",
                      style: TextStyle(fontSize: 24),
                    )),

                    vSize30SizedBox,

                    GestureDetector(
                      onTap: () async {
                        await _coreController.pickImage(
                            source: ImageSource.gallery,
                            imageFile: (file) {
                              _merchantController.setProductPic(file: file);
                            });
                      },
                      child: Obx(
                        () => Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: XploreColors.deepBlue),
                            child: _merchantController.productPic.value != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.file(
                                      File(_merchantController
                                          .productPic.value!.path),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  )
                                : Center(
                                    child: Icon(
                                    Icons.image_rounded,
                                    size: 48,
                                    color: XploreColors.white,
                                  ))),
                      ),
                    ),

                    vSize30SizedBox,

                    //  product name
                    CustomTextField(
                        hint: "Product Name",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product unit
                    CustomTextField(
                        hint: "Product Buying Price",
                        iconData: Icons.monetization_on_rounded,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productBuyingPriceController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product unit
                    CustomTextField(
                        hint: "Product Selling Price",
                        iconData: Icons.monetization_on_rounded,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productSellingPriceController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product unit
                    CustomTextField(
                        hint: "Product Unit",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productUnitController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product stock count
                    CustomTextField(
                        hint: "Product Stock count",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productStockCountController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product category
                    CustomTextField(
                        hint: "Product Category",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productCategoryController,
                        onChanged: (value) {}),

                    const SizedBox(
                      height: 100,
                    )
                  ],
                )),

            //  submit button
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => SubmitButton(
                      iconData: Icons.done_rounded,
                      isLoading: _merchantController.uploadButtonLoading.value,
                      isValid: true,
                      text: "Add Product",
                      onTap: () async {
                        var productModel = ProductModel(
                            sellerName: _authController.user.value!.userName,
                            sellerId: _authController.user.value!.userId,
                            productId: '',
                            productName: _productNameController.text,
                            productImageUrl: '',
                            productUnit: _productUnitController.text,
                            productBuyingPrice:
                                int.parse(_productBuyingPriceController.text),
                            productSellingPrice:
                                int.parse(_productSellingPriceController.text),
                            productCategoryId: _productCategoryController.text,
                            productCreatedAt: DateTime.now().toString(),
                            productStockCount:
                                int.parse(_productStockCountController.text));

                        await _merchantController.addProductToFirestore(
                            product: productModel,
                            productPic: _merchantController.productPic.value,
                            response: (state) {
                              switch (state) {
                                case ResponseState.success:
                                  _merchantController.setUploadButtonLoading(
                                      isLoading: false);
                                  break;
                                case ResponseState.loading:
                                  _merchantController.setUploadButtonLoading(
                                      isLoading: true);
                                  break;
                                case ResponseState.failure:
                                  _merchantController.setUploadButtonLoading(
                                      isLoading: false);

                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showSnackbar(
                                        title: "Error uploading product",
                                        message:
                                            "Something went wrong. please try again",
                                        iconData: Icons.login_rounded,
                                        iconColor: XploreColors.xploreOrange);
                                  });
                                  break;
                              }
                            },
                            onSuccess: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                showSnackbar(
                                    title: "Product uploaded!",
                                    message: "Product uploaded successfully!",
                                    iconData: Icons.library_books_rounded,
                                    iconColor: XploreColors.xploreOrange);
                              });

                              Get.back();
                            });
                      }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

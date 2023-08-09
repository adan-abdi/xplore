import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/show_snackbar.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/core/utils/constants.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

import '../../../../core/domain/model/response_state.dart';

class AddProductBottomSheet extends StatefulWidget {
  final ProductModel? product;

  const AddProductBottomSheet({super.key, this.product});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  late final TextEditingController _productNameController;
  late final TextEditingController _productUnitController;
  late final TextEditingController _productStockCountController;
  late final TextEditingController _productBuyingPriceController;
  late final TextEditingController _productSellingPriceController;
  late final MerchantController _merchantController;
  late final CoreController _coreController;
  late final AuthController _authController;

  late String? selectedCategory;

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController();
    _productUnitController = TextEditingController();
    _productStockCountController = TextEditingController();
    _productBuyingPriceController = TextEditingController();
    _productSellingPriceController = TextEditingController();
    _coreController = Get.find<CoreController>();
    _authController = Get.find<AuthController>();
    _merchantController = Get.find<MerchantController>();

    if (widget.product != null) {
      setControllerTexts();
    }
  }

  void setControllerTexts() {
    _productNameController.setText(widget.product!.productName!);
    _productBuyingPriceController
        .setText(widget.product!.productBuyingPrice!.toString());
    _productSellingPriceController
        .setText(widget.product!.productSellingPrice!.toString());
    _productUnitController.setText(widget.product!.productUnit!);
    _productStockCountController
        .setText(widget.product!.productStockCount!.toString());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        selectedCategory = widget.product!.productCategoryId!;
      });
    });
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
                      widget.product == null ? "Add Product" : "Update Product",
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
                        hint: "Product Buying Price (Ksh)",
                        iconData: Icons.monetization_on_rounded,
                        textStyle: TextStyle(fontSize: 16),
                        inputType: TextInputType.number,
                        controller: _productBuyingPriceController,
                        onChanged: (value) {
                          _productBuyingPriceController.setText(
                              _productBuyingPriceController.text
                                  .replaceAll(",", "")
                                  .addCommas);
                        }),

                    vSize20SizedBox,
                    //  product unit
                    CustomTextField(
                        hint: "Product Selling Price (Ksh)",
                        iconData: Icons.monetization_on_rounded,
                        textStyle: TextStyle(fontSize: 16),
                        inputType: TextInputType.number,
                        controller: _productSellingPriceController,
                        onChanged: (value) {
                          _productSellingPriceController.setText(
                              _productSellingPriceController.text
                                  .replaceAll(",", "")
                                  .addCommas);
                        }),

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
                        inputType: TextInputType.number,
                        controller: _productStockCountController,
                        onChanged: (value) {}),

                    vSize20SizedBox,

                    Container(
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        children: [
                          Icon(
                            Icons.category_rounded,
                            color: XploreColors.xploreOrange,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: DropdownButtonFormField<String>(
                                items: Constants.productCategoriesFiltered
                                    .map((category) => DropdownMenuItem<String>(
                                        value: category.categoryName,
                                        child: Row(
                                          children: [
                                            Icon(
                                              category.categoryIcon,
                                              color: XploreColors.deepBlue,
                                            ),
                                            SizedBox(
                                              width: 16,
                                            ),
                                            Text(category.categoryName),
                                          ],
                                        )))
                                    .toList(),
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Product Category",
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: XploreColors.xploreOrange)),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: XploreColors.deepBlue
                                                .withOpacity(0.1))),
                                    border: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: XploreColors.deepBlue
                                                .withOpacity(0.1)))),
                                value: widget.product != null
                                    ? selectedCategory
                                    : null,
                                onChanged: (s) {
                                  setState(() {
                                    selectedCategory = s;
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),

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
                      text: widget.product == null
                          ? "Add Product"
                          : "Update Product",
                      onTap: () async {
                        var productModel = ProductModel(
                            sellerName: _authController.user.value!.userName,
                            sellerId: _authController.user.value!.userId,
                            productId: '',
                            productName: _productNameController.text,
                            productImageUrl: '',
                            productUnit: _productUnitController.text,
                            productBuyingPrice: int.parse(
                                _productBuyingPriceController.text
                                    .replaceAll(",", "")),
                            productSellingPrice: int.parse(
                                _productSellingPriceController.text
                                    .replaceAll(",", "")),
                            productCategoryId: selectedCategory,
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

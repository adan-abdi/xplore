import 'dart:ffi';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pinput/pinput.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/show_snackbar.dart';
import 'package:shamiri/core/presentation/components/show_toast.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/core/utils/constants.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_home/presentation/components/pill_btn_alt.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/product_image.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/variations_bottom_sheet.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:shamiri/presentation/core/widgets/molecular/dashboard_tab_action_button.dart';

import '../../../../core/domain/model/response_state.dart';
import '../../../../core/presentation/components/open_bottom_sheet.dart';
import '../../../../core/presentation/components/show_alert_dialog.dart';
import '../../../feature_onboarding/presentation/components/image_picker_bottom_sheet.dart';

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
  late final TextEditingController _productSellingPriceController;
  late final TextEditingController _productDescriptionController;
  late final MerchantController _merchantController;
  late final CoreController _coreController;
  late final AuthController _authController;
  late final FToast _toast;
  late final GlobalKey<FormState> _globalKey;

  late String? selectedCategory = null;
  late String? sellingPrice = '';

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController();
    _productUnitController = TextEditingController();
    _productStockCountController = TextEditingController();
    _productSellingPriceController = TextEditingController();
    _productDescriptionController = TextEditingController();
    _coreController = Get.find<CoreController>();
    _authController = Get.find<AuthController>();
    _merchantController = Get.find<MerchantController>();
    _toast = FToast();
    _toast.init(context);
    _globalKey = GlobalKey<FormState>();

    if (widget.product != null) {
      setControllerTexts();
    }
  }

  void setControllerTexts() {
    _productNameController.setText(widget.product!.productName!);
    _productSellingPriceController.setText(
        widget.product!.productSellingPrice == null
            ? 'Priced by variants.'
            : widget.product!.productSellingPrice!.toString());
    _productUnitController.setText(widget.product!.productUnit!);
    _productStockCountController
        .setText(widget.product!.productStockCount!.toString());
    _productDescriptionController.setText(widget.product!.productDescription!);

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

                    //  product multiple images
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Container(
                            height: _merchantController
                                        .productPicsFromStorage.isEmpty &&
                                    (widget.product == null ||
                                        widget
                                            .product!.productImageUrls!.isEmpty)
                                ? 20
                                : 150,
                            width: double.infinity,
                            child:
                                _merchantController
                                            .productPicsFromStorage.isEmpty &&
                                        (widget.product == null ||
                                            widget.product!.productImageUrls!
                                                .isEmpty)
                                    ? Text("No images yet")
                                    : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Obx(
                                          () => Row(
                                            children: [
                                              //  firestore images
                                              widget.product != null &&
                                                      widget
                                                          .product!
                                                          .productImageUrls!
                                                          .isNotEmpty
                                                  ? ListView.builder(
                                                      itemBuilder:
                                                          (context, index) =>
                                                              Obx(
                                                        () => ProductImage(
                                                          url: widget.product!
                                                                  .productImageUrls![
                                                              index],
                                                          isDeleteInProgress:
                                                              _merchantController
                                                                  .deleteImageLoading
                                                                  .value,
                                                          onDelete: () async {
                                                            //  delete product image from firestore
                                                            await _merchantController
                                                                .deleteProductPicFromStorage(
                                                                    product: widget
                                                                        .product!,
                                                                    imageUrl: widget
                                                                            .product!
                                                                            .productImageUrls![
                                                                        index],
                                                                    response:
                                                                        (state) {
                                                                      switch (
                                                                          state) {
                                                                        case ResponseState
                                                                              .success:
                                                                          _merchantController.setDeleteImageLoading(
                                                                              isLoading: false);
                                                                          break;
                                                                        case ResponseState
                                                                              .loading:
                                                                          _merchantController.setDeleteImageLoading(
                                                                              isLoading: true);
                                                                          break;
                                                                        case ResponseState
                                                                              .failure:
                                                                          _merchantController.setDeleteImageLoading(
                                                                              isLoading: false);
                                                                          WidgetsBinding
                                                                              .instance
                                                                              .addPostFrameCallback((_) {
                                                                            showSnackbar(
                                                                                title: "Error deleting product image.",
                                                                                message: "Something went wrong. please try again",
                                                                                iconData: Icons.login_rounded,
                                                                                iconColor: XploreColors.xploreOrange);
                                                                          });
                                                                          break;
                                                                      }
                                                                    });

                                                            showSnackbar(
                                                                title:
                                                                    "Deleted Image successfully.",
                                                                message:
                                                                    "Image deleted successfully!",
                                                                iconData: Icons
                                                                    .login_rounded,
                                                                iconColor:
                                                                    XploreColors
                                                                        .xploreOrange);
                                                          },
                                                        ),
                                                      ),
                                                      itemCount: widget
                                                          .product!
                                                          .productImageUrls!
                                                          .length,
                                                      shrinkWrap: true,
                                                      physics:
                                                          const BouncingScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                    )
                                                  : SizedBox.shrink(),

                                              //  local images
                                              ListView.builder(
                                                itemBuilder: (context, index) =>
                                                    ProductImage(
                                                  filePath: _merchantController
                                                      .productPicsFromStorage[
                                                          index]
                                                      .path,
                                                  onDelete: () {
                                                    _merchantController
                                                        .deleteProductPic(
                                                            file: _merchantController
                                                                    .productPicsFromStorage[
                                                                index]);
                                                  },
                                                ),
                                                itemCount: _merchantController
                                                    .productPicsFromStorage
                                                    .length,
                                                shrinkWrap: true,
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                          ),
                        ),

                        vSize30SizedBox,

                        //  multi-image button
                        Row(
                          children: [
                            CustomFAB(
                                actionIcon: Icons.image_rounded,
                                actionLabel: "Pick Images",
                                tag: "Pick Images FAB",
                                onPressed: () async {
                                  showToast(
                                      toast: _toast,
                                      iconData: Icons.image_rounded,
                                      msg: "Hold to pick multiple images");

                                  await _coreController.pickMultiImages(
                                      imageFiles: (imageFiles) =>
                                          _merchantController
                                              .addProductPictures(
                                                  files: imageFiles));
                                }),
                            hSize10SizedBox,
                            CustomFAB(
                                actionIcon: Icons.color_lens_rounded,
                                actionLabel: "Add Variation",
                                tag: "Variation",
                                onPressed: () async {
                                  openBottomSheet(
                                      content: VariationsBottomSheet(),
                                      onComplete: () {});
                                }),
                          ],
                        ),
                      ],
                    ),

                    vSize30SizedBox,

                    //  product variations
                    Obx(
                      () => Visibility(
                        visible:
                            _merchantController.productVariations.isNotEmpty,
                        child: Container(
                          height: 50,
                          child: Obx(
                            () => ListView.separated(
                              itemBuilder: (context, index) => Row(
                                children: [
                                  PillBtnAlt(
                                      text: _merchantController
                                          .productVariations[index]
                                          .variationName!,
                                      onTap: () {}),
                                  hSize5SizedBox,
                                  Visibility(
                                    visible: _merchantController
                                        .productVariations[index].variationAffectsPrice!,
                                    child: Text(
                                        "Ksh ${_merchantController.productVariations[index].variationPrice!.toString().addCommas}"),
                                  )
                                ],
                              ),
                              separatorBuilder: (context, index) =>
                                  hSize10SizedBox,
                              itemCount:
                                  _merchantController.productVariations.length,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ),
                      ),
                    ),

                    vSize20SizedBox,

                    Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            //  product name
                            CustomTextField(
                              hint: "Product name",
                              iconData: Icons.description,
                              textStyle: TextStyle(fontSize: 16),
                              controller: _productNameController,
                              onChanged: (value) {},
                              onValidate: (value) {
                                if (value!.isEmpty) {
                                  return 'Product name cannot be empty';
                                } else {
                                  return null;
                                }
                              },
                            ),

                            vSize8SizedBox,
                            //  product unit
                            Obx(
                              () {
                                final isSellingPriceEnabled =
                                    _merchantController
                                            .productVariations.isEmpty ||
                                        _merchantController.productVariations
                                            .map((variation) =>
                                                variation.variationAffectsPrice)
                                            .toList()
                                            .every((elem) => elem == false);

                                if (!isSellingPriceEnabled) {
                                  _productSellingPriceController
                                      .setText('Priced by variants.');
                                } else {
                                  _productSellingPriceController
                                      .setText(sellingPrice!);
                                }

                                return CustomTextField(
                                    hint: "Product selling Price (Ksh)",
                                    iconData: Icons.monetization_on_rounded,
                                    isEnabled: isSellingPriceEnabled,
                                    textStyle: TextStyle(fontSize: 16),
                                    inputType: TextInputType.number,
                                    controller: _productSellingPriceController,
                                    onChanged: (value) {
                                      setState(() {
                                        sellingPrice = value;
                                      });
                                      if (isSellingPriceEnabled) {
                                        _productSellingPriceController.setText(
                                            _productSellingPriceController.text
                                                .replaceAll(",", "")
                                                .addCommas);
                                      }
                                    },
                                    onValidate: (value) {
                                      if (value!.isEmpty) {
                                        return 'Product selling price cannot be empty';
                                      } else {
                                        return null;
                                      }
                                    });
                              },
                            ),

                            vSize8SizedBox,
                            //  product unit
                            CustomTextField(
                                hint: "Product unit e.g per litre, per kg etc",
                                iconData: Icons.scale_rounded,
                                textStyle: TextStyle(fontSize: 16),
                                controller: _productUnitController,
                                onChanged: (value) {}),

                            vSize8SizedBox,
                            //  product stock count
                            CustomTextField(
                                hint: "Product stock count",
                                iconData: Icons.account_tree_rounded,
                                textStyle: TextStyle(fontSize: 16),
                                inputType: TextInputType.number,
                                controller: _productStockCountController,
                                onChanged: (value) {}),

                            vSize8SizedBox,

                            CustomTextField(
                                hint: "Product description",
                                iconData: Icons.description_rounded,
                                textStyle: TextStyle(fontSize: 16),
                                inputType: TextInputType.text,
                                maxLines: null,
                                controller: _productDescriptionController,
                                onChanged: (value) {}),
                          ],
                        )),

                    vSize8SizedBox,

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
                        if (_globalKey.currentState!.validate()) {
                          var productModel = ProductModel(
                              sellerName: _authController.user.value!.userName,
                              sellerId: _authController.user.value!.userId,
                              productId: '',
                              productName: _productNameController.text,
                              productImageUrls: [],
                              productUnit: _productUnitController.text,
                              productBuyingPrice: 0,
                              productSellingPrice:
                                  _productSellingPriceController.text ==
                                          'Priced by variants.'
                                      ? null
                                      : int.parse(_productSellingPriceController
                                          .text
                                          .replaceAll(",", "")),
                              productCategoryId: selectedCategory,
                              productCreatedAt: DateTime.now().toString(),
                              productStockCount:
                                  int.parse(_productStockCountController.text),
                              productDescription:
                                  _productDescriptionController.text,
                              productVariations:
                                  _merchantController.productVariations,
                              activeProductVariations: []);

                          if (widget.product == null) {
                            //  add new product
                            await _merchantController.addProductToFirestore(
                                product: productModel,
                                productPics:
                                    _merchantController.productPicsFromStorage,
                                response: (state) {
                                  switch (state) {
                                    case ResponseState.success:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: false);
                                      break;
                                    case ResponseState.loading:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: true);
                                      break;
                                    case ResponseState.failure:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: false);

                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        showSnackbar(
                                            title: "Error uploading product",
                                            message:
                                                "Something went wrong. please try again",
                                            iconData: Icons.login_rounded,
                                            iconColor:
                                                XploreColors.xploreOrange);
                                      });
                                      break;
                                  }
                                },
                                onUploadComplete: () {
                                  //  reset the merchant controller product pics
                                  _merchantController.clearPickedProductPics();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showSnackbar(
                                        title: "Images uploaded!",
                                        message:
                                            "Product images uploaded successfully!",
                                        iconData: Icons.library_books_rounded,
                                        iconColor: XploreColors.xploreOrange);
                                  });
                                },
                                onTransfer: (bytesTransferredPercentage) {
                                  print(
                                      "Bytes Transferred : $bytesTransferredPercentage");
                                },
                                onSuccess: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showSnackbar(
                                        title: "Product uploaded!",
                                        message:
                                            "Product uploaded successfully!",
                                        iconData: Icons.library_books_rounded,
                                        iconColor: XploreColors.xploreOrange);
                                  });

                                  Get.back();
                                });
                          } else {
                            //  update current product
                            await _merchantController.updateProduct(
                                oldProduct: widget.product!,
                                newProduct: ProductModel(
                                    productName: _productNameController.text,
                                    productUnit: _productUnitController.text,
                                    productBuyingPrice: 0,
                                    productSellingPrice:
                                        _productSellingPriceController.text ==
                                                'Priced by variants.'
                                            ? null
                                            : int.parse(
                                                _productSellingPriceController
                                                    .text
                                                    .replaceAll(",", "")),
                                    productCategoryId: selectedCategory,
                                    productStockCount: int.parse(
                                        _productStockCountController.text),
                                    productDescription:
                                        _productDescriptionController.text),
                                productPics:
                                    _merchantController.productPicsFromStorage,
                                onUploadComplete: () {
                                  //  reset the merchant controller product pics
                                  _merchantController.clearPickedProductPics();
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    showSnackbar(
                                        title: "Images uploaded!",
                                        message:
                                            "Product images uploaded successfully!",
                                        iconData: Icons.library_books_rounded,
                                        iconColor: XploreColors.xploreOrange);
                                  });
                                },
                                onTransfer: (bytesTransferredPercentage) {
                                  print(
                                      "Bytes Transferred : $bytesTransferredPercentage");
                                },
                                response: (state) {
                                  switch (state) {
                                    case ResponseState.success:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: false);

                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        showSnackbar(
                                            title: "Product updated!",
                                            message:
                                                "Product updated successfully!",
                                            iconData:
                                                Icons.library_books_rounded,
                                            iconColor:
                                                XploreColors.xploreOrange);
                                      });

                                      Get.back();
                                      Get.back();
                                      break;
                                    case ResponseState.loading:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: true);
                                      break;
                                    case ResponseState.failure:
                                      _merchantController
                                          .setUploadButtonLoading(
                                              isLoading: false);

                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        showSnackbar(
                                            title: "Error uploading product",
                                            message:
                                                "Something went wrong. please try again",
                                            iconData: Icons.login_rounded,
                                            iconColor:
                                                XploreColors.xploreOrange);
                                      });
                                      break;
                                  }
                                });
                          }
                        }
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

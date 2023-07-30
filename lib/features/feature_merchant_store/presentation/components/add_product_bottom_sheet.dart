import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/core/presentation/controller/core_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({super.key});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  late final TextEditingController _productNameController;
  late final MerchantController _merchantController;
  late final CoreController _coreController;

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController();
    _coreController = Get.find<CoreController>();
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
                                    child:
                                        Icon(Icons.image_rounded, size: 48))),
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
                        hint: "Product Unit",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product stock count
                    CustomTextField(
                        hint: "Product Stock count",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value) {}),

                    vSize20SizedBox,
                    //  product category
                    CustomTextField(
                        hint: "Product Category",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value) {}),

                    const SizedBox(
                      height: 100,
                    )
                  ],
                )),

            //  submit button
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubmitButton(
                    iconData: Icons.done_rounded,
                    isLoading: false,
                    text: "Add Product",
                    onTap: () {
                      //  TODO: ADD PRODUCT TO DATABASE

                      // var productModel

                      Get.back();
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

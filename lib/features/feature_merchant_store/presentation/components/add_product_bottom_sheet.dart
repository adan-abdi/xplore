import 'package:flutter/material.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/custom_textfield.dart';
import 'package:shamiri/core/presentation/components/submit_button.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:get/get.dart';

class AddProductBottomSheet extends StatefulWidget {
  const AddProductBottomSheet({super.key});

  @override
  State<AddProductBottomSheet> createState() => _AddProductBottomSheetState();
}

class _AddProductBottomSheetState extends State<AddProductBottomSheet> {
  late final TextEditingController _productNameController;

  @override
  void initState() {
    super.initState();

    _productNameController = TextEditingController();
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
                          "Add Products",
                          style: TextStyle(fontSize: 24),
                        )),

                    vSize30SizedBox,

                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: XploreColors.deepBlue
                      ),
                      child: Center(
                        child: Icon(Icons.image_rounded, color: XploreColors.white, size: 80,),
                      ),
                    ),

                    vSize30SizedBox,

                    //  product name
                    CustomTextField(
                        hint: "Product Name",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value){}),

                    vSize20SizedBox,
                    //  product unit
                    CustomTextField(
                        hint: "Product Unit",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value){}),

                    vSize20SizedBox,
                    //  product stock count
                    CustomTextField(
                        hint: "Product Stock count",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value){}),

                    vSize20SizedBox,
                    //  product category
                    CustomTextField(
                        hint: "Product Category",
                        iconData: Icons.description,
                        textStyle: TextStyle(fontSize: 16),
                        controller: _productNameController,
                        onChanged: (value){}),

                    const SizedBox(height: 100,)
                  ],
                )),

            //  submit button
            Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SubmitButton(iconData: Icons.done_rounded, text: "Add Product", onTap: (){
                  //  TODO: ADD PRODUCT TO DATABASE
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

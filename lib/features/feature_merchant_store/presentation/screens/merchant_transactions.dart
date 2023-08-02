import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:get/get.dart';

class MerchantTransactions extends StatefulWidget {
  const MerchantTransactions({super.key});

  @override
  State<MerchantTransactions> createState() => _MerchantTransactionsState();
}

class _MerchantTransactionsState extends State<MerchantTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.white,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: XploreColors.white,
            systemNavigationBarColor: XploreColors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
        title: Text("Transactions", style: TextStyle(color: XploreColors.black),),
        centerTitle: true,
        backgroundColor: XploreColors.white,
        elevation: 0,
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.arrow_back_rounded, color: XploreColors.black)),
      ),
      body: Text("Transactions"),
    );
  }
}

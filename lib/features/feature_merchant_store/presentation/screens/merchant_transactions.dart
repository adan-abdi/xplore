import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:get/get.dart';
import 'package:shamiri/core/domain/model/user_model.dart';
import 'package:shamiri/core/presentation/components/show_alert_dialog.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_types.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/credit_transactions.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/pending_transactions.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_toggle.dart';

import '../../../../presentation/core/widgets/molecular/dashboard_tab_action_button.dart';
import '../components/fulfilled_transactions.dart';
import '../controller/merchant_controller.dart';

class MerchantTransactions extends StatefulWidget {
  const MerchantTransactions({super.key});

  @override
  State<MerchantTransactions> createState() => _MerchantTransactionsState();
}

class _MerchantTransactionsState extends State<MerchantTransactions> {
  late final MerchantController _merchantController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: XploreColors.white,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: XploreColors.white,
              systemNavigationBarColor: XploreColors.white,
              systemNavigationBarIconBrightness: Brightness.dark),
          title: Text(
            "Transactions",
            style: TextStyle(color: XploreColors.black),
          ),
          centerTitle: true,
          backgroundColor: XploreColors.white,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon:
              Icon(Icons.arrow_back_rounded, color: XploreColors.black)),
        ),
        body: Column(
          children: [
            Obx(
                  () => Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: vSize10SizedBox,
                    ),
                    //  fullfilled, pending toggle,
                    TransactionToggle(),
                    SliverToBoxAdapter(
                      child: vSize30SizedBox,
                    ),
                    // main body
                    _merchantController.activeTransactionType.value ==
                        TransactionTypes.fulfilled
                        ? FulfilledTransactions()
                        : _merchantController.activeTransactionType.value ==
                        TransactionTypes.credit
                        ? CreditTransactions()
                        : PendingTransactions()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

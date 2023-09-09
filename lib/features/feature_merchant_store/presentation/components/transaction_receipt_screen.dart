import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/components/show_toast.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/receipt.dart';

import '../../../../core/domain/model/user_model.dart';
import '../../../../core/presentation/components/show_alert_dialog.dart';
import '../../../../core/presentation/components/submit_button.dart';
import '../../../../core/presentation/controller/auth_controller.dart';
import '../../../feature_home/presentation/controller/home_controller.dart';
import '../../domain/model/transaction_model.dart';
import '../../domain/model/transaction_types.dart';

class TransactionReceiptScreen extends StatefulWidget {
  final List<TransactionModel> allTransactionsByBuyer;
  final String customerName;

  const TransactionReceiptScreen(
      {super.key,
      required this.allTransactionsByBuyer,
      required this.customerName});

  @override
  State<TransactionReceiptScreen> createState() =>
      _TransactionReceiptScreenState();
}

class _TransactionReceiptScreenState extends State<TransactionReceiptScreen> {
  late final HomeController _homeController;
  late final AuthController _authController;
  late final FToast _toast;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
    _toast = FToast();
    _toast.init(context);
  }

  String getUserName() {
    UserModel? userName = widget.allTransactionsByBuyer[0].buyerId!
                .split(" ")
                .toList()[0] ==
            'customer'
        ? null
        : _homeController.stores.firstWhereOrNull((store) =>
            store.userId! ==
            widget.allTransactionsByBuyer[0].buyerId!.split(" ").toList()[0]);

    return userName == null ? 'Unknown' : userName.userName!;
  }

  int getTotalPrice() {
    final allTransactionsPrice = _authController.user.value!.transactions!
        .where((transaction) =>
            transaction.buyerId!.formatBuyerId ==
            widget.allTransactionsByBuyer[0].buyerId!.formatBuyerId)
        .map((transaction) => transaction.amountPaid!)
        .reduce((value, element) => value + element);

    return allTransactionsPrice;
  }

  TransactionTypes getTransactionType({required int index}) {
    final transaction = widget.allTransactionsByBuyer[index];

    return TransactionTypes.values
        .firstWhere((type) => type.toString() == transaction.transactionType!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XploreColors.deepBlue,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarColor: XploreColors.deepBlue,
            systemNavigationBarColor: XploreColors.deepBlue,
            systemNavigationBarIconBrightness: Brightness.light),
        backgroundColor: XploreColors.deepBlue,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_rounded, color: XploreColors.white)),
        elevation: 0,
        title: Text(
          "Receipt",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //  receipt
                Receipt(
                  userName: widget.customerName,
                  totalPrice: getTotalPrice().toString().addCommas,
                  allTransactionsByBuyer: widget.allTransactionsByBuyer,
                ),

                vSize20SizedBox,

                //  call to action button
                Visibility(
                    visible: getTransactionType(index: 0) ==
                            TransactionTypes.pending ||
                        getTransactionType(index: 0) == TransactionTypes.credit,
                    child: SubmitButton(
                        iconData: getTransactionType(index: 0) ==
                                TransactionTypes.pending
                            ? Icons.done_rounded
                            : Icons.attach_money_rounded,
                        text: getTransactionType(index: 0) ==
                                TransactionTypes.pending
                            ? "Complete"
                            : "Pay",
                        backgroundColor: XploreColors.white,
                        hasMargin: false,
                        textColor: XploreColors.deepBlue,
                        isValid: true,
                        onTap: () {
                          showAlertDialog(
                              title: "Complete Transaction",
                              iconData: Icons.receipt_rounded,
                              content: Text(
                                "Would you like to complete this transaction?",
                                textAlign: TextAlign.center,
                              ),
                              onCancel: () => Get.back(),
                              onConfirm: () async {
                                //  all transactions
                                final allTransactions =
                                    _authController.user.value!.transactions!;

                                allTransactions.forEach((transaction) {
                                  if (transaction.buyerId!.formatBuyerId ==
                                      widget
                                          .allTransactionsByBuyer[0].buyerId!.formatBuyerId) {
                                    transaction.transactionType =
                                        TransactionTypes.fulfilled.toString();
                                    transaction.transactionCompletedDate =
                                        DateTime.now().toString();
                                  }
                                });

                                await _authController
                                    .updateUserDataInFirestore(
                                        oldUser: _authController.user.value!,
                                        newUser: UserModel(
                                            transactions: allTransactions),
                                        uid:
                                            _authController.user.value!.userId!,
                                        response: (state, error) {})
                                    .then((value) {
                                  showToast(
                                      toast: _toast,
                                      iconData: Icons.done_rounded,
                                      msg:
                                          'Transaction completed successfully!');

                                  Get.back();
                                  Get.back();
                                });
                              });
                        })),
              ],
            ),
          )),
    );
  }
}

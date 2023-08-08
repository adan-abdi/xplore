import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/transaction_types.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/controller/merchant_controller.dart';
import 'package:get/get.dart';

class TransactionToggle extends StatefulWidget {
  const TransactionToggle({super.key});

  @override
  State<TransactionToggle> createState() => _TransactionToggleState();
}

class _TransactionToggleState extends State<TransactionToggle> {
  late final MerchantController _merchantController;

  @override
  void initState() {
    super.initState();

    _merchantController = Get.find<MerchantController>();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Obx(
      () => UnconstrainedBox(
        child: Container(
          width: 260,
          height: 60,
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: XploreColors.deepBlue,
          ),
          child: Row(
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  _merchantController.setActiveTransactionType(transactionType: TransactionTypes.fulfilled);
                },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _merchantController.activeTransactionType.value ==
                            TransactionTypes.fulfilled
                        ? XploreColors.xploreOrange
                        : XploreColors.deepBlue,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.done_all_rounded,
                        size: 24,
                        color: _merchantController.activeTransactionType.value ==
                            TransactionTypes.fulfilled
                            ? XploreColors.deepBlue
                            : XploreColors.xploreOrange,
                      ),
                      Text(
                        "Fulfilled",
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontWeight,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                            color: XploreColors.white),
                      ),
                    ],
                  ),
                ),
              )),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  _merchantController.setActiveTransactionType(
                      transactionType: TransactionTypes.pending);
                },
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: _merchantController.activeTransactionType.value ==
                        TransactionTypes.pending
                        ? XploreColors.xploreOrange
                        : XploreColors.deepBlue
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.pending_actions_rounded,
                        size: 24,
                        color: _merchantController.activeTransactionType.value ==
                            TransactionTypes.pending
                            ? XploreColors.deepBlue
                            : XploreColors.xploreOrange
                      ),
                      Text(
                        "Pending",
                        style: TextStyle(
                            fontWeight: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontWeight,
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.fontSize,
                            color: XploreColors.white),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    ));
  }
}

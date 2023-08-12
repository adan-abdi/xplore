import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shamiri/application/core/themes/colors.dart';
import 'package:shamiri/core/presentation/controller/auth_controller.dart';
import 'package:shamiri/core/utils/extensions/string_extensions.dart';
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/features/feature_home/presentation/controller/home_controller.dart';
import 'package:shamiri/features/feature_merchant_store/presentation/components/transaction_tile.dart';
import 'package:timeline_tile/timeline_tile.dart';

class FulfilledTransactions extends StatefulWidget {
  const FulfilledTransactions({super.key});

  @override
  State<FulfilledTransactions> createState() => _FulfilledTransactionsState();
}

class _FulfilledTransactionsState extends State<FulfilledTransactions> {
  late final HomeController _homeController;
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();

    _homeController = Get.find<HomeController>();
    _authController = Get.find<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => _authController.user.value!.transactions!.isNotEmpty
          ? SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                final userDetails = _homeController.stores.firstWhere((store) =>
                    store.userId! ==
                    _authController.user.value!.transactions![index].buyerId);

                final transaction =
                    _authController.user.value!.transactions![index];

                final product = _homeController.products.firstWhere(
                    (prod) => prod.productId! == transaction.productId!);

                return TransactionTile(
                    isFirst: index == 0 ? true : false,
                    isLast: index ==
                            _authController.user.value!.transactions!.length - 1
                        ? true
                        : false,
                    isPast: true,
                    iconData: Icons.date_range,
                    content: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //  user name
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${userDetails.userName}",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "+ Ksh. ${transaction.amountPaid.toString().addCommas}",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: XploreColors.xploreOrange),
                              ),
                            ],
                          ),

                          vSize20SizedBox,

                          //  product bought
                          Container(
                            width: double.infinity,
                            height: 80,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: XploreColors.deepBlue),
                            child: Row(
                              children: [
                                //  image
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: XploreColors.xploreOrange,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: product.productImageUrl != null &&
                                            product.productImageUrl!.isNotEmpty
                                        ? Image.network(
                                            product.productImageUrl!,
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                          )
                                        : Icon(
                                            Icons.add_shopping_cart_rounded,
                                            color: XploreColors.white,
                                          ),
                                  ),
                                ),

                                //  product name
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${product.productName!}",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: XploreColors.white),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "${transaction.transactionDate!.formatDate}",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: XploreColors.white,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional.centerEnd,
                                                child: Text(
                                                  "${transaction.itemsBought!} items",
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      color: XploreColors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
              }, childCount: _authController.user.value!.transactions!.length)),
            )
          : SliverFillRemaining(
              child: Center(
                child: Text("No fulfilled transactions"),
              ),
            ),
    );
  }
}

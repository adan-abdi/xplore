// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamiri/application/singletons/product_listing_status.dart';
import 'package:shamiri/application/singletons/search_state.dart';
import 'package:shamiri/domain/value_objects/app_enums.dart';

// Project imports:
import 'package:shamiri/domain/value_objects/app_spaces.dart';
import 'package:shamiri/infrastructure/remote_repository/firestore_product.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/dashboard_shimmer.dart';
import 'package:shamiri/presentation/dashboard/widgets/layout/product_listing_data_grid.dart';

// ignore: must_be_immutable
class MerchantStore extends StatefulWidget {
  SearchStatus searchStatus;
  ProductListingStatus productListingStatus;

  MerchantStore(
      {Key? key,
      required this.searchStatus,
      required this.productListingStatus})
      : super(key: key);

  @override
  _MerchantStoreState createState() => _MerchantStoreState();
}

class _MerchantStoreState extends State<MerchantStore> {
  ProductRepository productRepositoryInstance = ProductRepository();
  Stream<QuerySnapshot<Object?>>? productStream;

  @override
  void initState() {
    super.initState();
    widget.productListingStatus.productState.add(ProductListingStates.dataGrid);
  }

  @override
  Widget build(BuildContext context) {
    var productState = widget.productListingStatus.productState.value;

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(children: <Widget>[
        vSize10SizedBox,
        (productState.index == 2)
            ? Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: productRepositoryInstance.getProductStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(child: Text('Something went wrong')));
                      } else if (snapshot.hasData &&
                          snapshot.data != null) {
                        return ProductDataGrid(
                          snapshotData: snapshot.data,
                        );
                      }
                      return DashboardShimmer();
                    }),
              )
            : Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: productRepositoryInstance.getSearchStream(
                        state: widget.productListingStatus.productState.value,
                        searchterm: widget.searchStatus.searchTerm.value),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Container(
                            height: MediaQuery.of(context).size.height * 0.7,
                            child: Center(child: Text('Something went wrong')));
                      } else if (snapshot.hasData &&
                          snapshot.data != null && !(snapshot.data!.docs.length == 0)) {
                        return ProductDataGrid(
                          snapshotData: snapshot.data,
                        );
                      }
                      return DashboardShimmer();
                    }),
              ),
      ]),
    );
  }
}

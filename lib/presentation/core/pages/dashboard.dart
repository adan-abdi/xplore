import 'package:flutter/src/widgets/framework.dart';
import 'package:shamiri/presentation/core/pages/dashboard_scaffold.dart';
import 'package:shamiri/presentation/dashboard/pages/merchant_records.dart';
import 'package:shamiri/presentation/dashboard/pages/merchant_store.dart';

class XploreDashboard extends StatelessWidget {
  const XploreDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(tabs: [
      MerchantStore(),
      MerchantRecords(),
    ]);
  }
}

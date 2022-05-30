// Flutter imports:
import 'package:flutter/src/widgets/framework.dart';

// Project imports:
import 'package:shamiri/application/singletons/dashboard_current_index.dart';
import 'package:shamiri/presentation/core/pages/dashboard_scaffold.dart';
import 'package:shamiri/presentation/dashboard/pages/merchant_records.dart';
import 'package:shamiri/presentation/dashboard/pages/merchant_store.dart';

var globalDashIndex = DashboardIndexStatusStore();

class XploreDashboard extends StatefulWidget {
  const XploreDashboard({Key? key}) : super(key: key);

  @override
  State<XploreDashboard> createState() => _XploreDashboardState();
}

class _XploreDashboardState extends State<XploreDashboard> {
  @override
  Widget build(BuildContext context) {
    return DashboardScaffold(
      tabs: [
        MerchantStore(),
        MerchantRecords(),
      ],
      dashboardIndexStatusStore: globalDashIndex,
    );
  }
}

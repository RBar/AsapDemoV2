// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/home/tab_active_and_past_orders.dart';

class HomeTabBarView extends StatelessWidget {
  final TabController controller;
  const HomeTabBarView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: _getTabHeight(size.height),
      width: size.width,
      child: TabBarView(controller: controller, children: const [
        ActiveAndPastOrdersWidget(active: true),
        ActiveAndPastOrdersWidget(active: false),
      ]),
    );
  }

  double _getTabHeight(double deviceHeight) {
    if (deviceHeight >= 1200) {
      return deviceHeight * 0.9;
    } else if (deviceHeight <= 600) {
      return deviceHeight * 0.7;
    } else {
      return deviceHeight * 0.75;
    }
  }
}

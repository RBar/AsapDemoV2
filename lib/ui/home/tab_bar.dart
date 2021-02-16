// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';

class HomeTabBar extends StatelessWidget {
  final TabController controller;
  const HomeTabBar({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: size.width * 0.1),
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      width: size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: ColorPalette.lightPurple(),
      ),
      child: Center(
        child: SizedBox(
          height: 35,
          child: TabBar(
            controller: controller,
            labelPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            tabs: const [
              Tab(
                icon: Text(
                  'Active orders',
                ),
              ),
              Tab(
                icon: Text('Past orders'),
              ),
            ],
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            unselectedLabelColor: Colors.white,
            indicator: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              color: Color.fromRGBO(22, 2, 70, 1),
            ),
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}

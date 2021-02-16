// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'drawer_list_tile_item.dart';
import 'drawer_menu_switch.dart';

class DrawerItemsColumn extends StatelessWidget {
  const DrawerItemsColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      color: ColorPalette.baseBlue(),
      height: size.height * 0.8,
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: const [
                Text(
                  "Menus",
                ),
                Expanded(child: SizedBox()),
                MenuSwitch()
              ],
            ),
          ),
          ...const [
            ListTileItem(icon: FontAwesomeIcons.store, text: "Ordenes menus"),
            ListTileItem(
                icon: FontAwesomeIcons.utensils, text: "Elementos de menus"),
            ListTile(
              title: Text(
                "My orders",
              ),
            ),
            ListTileItem(
                icon: FontAwesomeIcons.shoppingBag, text: "New Delivery"),
            ListTileItem(icon: FontAwesomeIcons.truckMoving, text: "My orders"),
            ListTileItem(icon: FontAwesomeIcons.wallet, text: "Wallet"),
            Expanded(
              child: SizedBox(),
            ),
            Text("")
          ]
        ],
      ),
    );
  }
}

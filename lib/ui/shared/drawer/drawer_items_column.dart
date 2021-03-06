// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:asapdemo/auth/application/auth_bloc/auth_bloc.dart';
import 'package:asapdemo/core/routes/routes.dart';
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
      height: size.height,
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
          ...[
            const ListTileItem(
                icon: FontAwesomeIcons.store, text: "Ordenes menus"),
            const ListTileItem(
                icon: FontAwesomeIcons.utensils, text: "Elementos de menus"),
            const ListTile(
              title: Text(
                "My orders",
              ),
            ),
            const ListTileItem(
                icon: FontAwesomeIcons.shoppingBag, text: "New Delivery"),
            const ListTileItem(
                icon: FontAwesomeIcons.truckMoving, text: "My orders"),
            const ListTileItem(icon: FontAwesomeIcons.wallet, text: "Wallet"),
            const ListTile(),
            InkWell(
                onTap: () => _logoutAlertDialog(context),
                child: const ListTileItem(
                    icon: FontAwesomeIcons.signOutAlt, text: "Sign out")),
            const Expanded(
              child: SizedBox(),
            ),
            const Text("")
          ]
        ],
      ),
    );
  }

  void _logoutAlertDialog(BuildContext context) {
    //show the alert dialog and log out the user
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Log out',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure yout want to log out?",
              style: TextStyle(color: Colors.black)),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.signedOut());
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.splash, (Route<dynamic> route) => false);
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(fontWeight: FontWeight.w500),
                )),
            FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(
                  'No',
                  style: TextStyle(fontWeight: FontWeight.w600),
                )),
          ],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        );
      },
    );
  }
}

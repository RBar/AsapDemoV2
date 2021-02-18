// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/shared/drawer/drawer_items_column.dart';
import 'package:asapdemo/ui/shared/drawer/user_list_tile.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: ColorPalette.lightPurple()),
      child: ListTileTheme(
        iconColor: Colors.white,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SizedBox(
            height: size.height * 1,
            width: size.height * 1,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [_Drawer()],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: size.height * 0.8,
        child: Drawer(
          child: ListView(
            children: [
              Container(
                  color: ColorPalette.lightPurple(),
                  child: const UserListTile()),
              const DrawerItemsColumn()
            ],
          ),
        ),
      ),
    );
  }
}

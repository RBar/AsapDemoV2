// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';

AppBar mainAppBar(GlobalKey<ScaffoldState> scaffoldKey, Widget title) {
  return AppBar(
    backgroundColor: ColorPalette.lightPurple(),
    leading: IconButton(
      icon: const Icon(
        FontAwesomeIcons.bars,
      ),
      onPressed: () {
        scaffoldKey.currentState.openDrawer();
      },
    ),
    elevation: 10,
    title: title,
  );
}

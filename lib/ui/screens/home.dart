// Dart imports:
import 'dart:ui';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:google_fonts/google_fonts.dart';

// Project imports:
import 'package:asapdemo/ui/helpers/color_palette.dart';
import 'package:asapdemo/ui/home/tab_bar.dart';
import 'package:asapdemo/ui/home/tab_bar_view.dart';
import 'package:asapdemo/ui/shared/drawer/drawer_menu.dart';
import 'package:asapdemo/ui/shared/main_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      appBar: mainAppBar(
          _scaffoldKey,
          Text(
            "Menu Orders",
            style: GoogleFonts.raleway(fontWeight: FontWeight.w400),
          )),
      backgroundColor: ColorPalette.baseBlue(),
      body: Container(
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          children: [
            HomeTabBar(controller: _controller),
            HomeTabBarView(
              controller: _controller,
            )
          ],
        ),
      ),
    );
  }
}

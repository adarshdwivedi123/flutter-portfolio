import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/portfolio/portfolio_view.dart';

import 'package:provider/provider.dart';

class Drawerview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: DrawerMobileView(),
      desktopView: SizedBox(),
    );
  }
}

class DrawerMobileView extends StatelessWidget {
  const DrawerMobileView({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue],
                  tileMode: TileMode.repeated),
            ),
            child: Text('<Adarsh Dwivedi>'),
          ),
          for (var item in navigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                scrollController.animateTo(
                  item.position,
                  duration: Duration(milliseconds: 700),
                  curve: Curves.easeInOut,
                );

                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

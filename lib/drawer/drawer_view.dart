import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/navigation_bar/navigation_bar_view.dart';

class Drawerview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: DrawerDesktopView(),
      desktopView: SizedBox(),
    );
  }
}

class DrawerDesktopView extends StatelessWidget {
  const DrawerDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          for (var item in kNavigationItems)
            ListTile(
              title: Text(item.text),
              onTap: () {
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}

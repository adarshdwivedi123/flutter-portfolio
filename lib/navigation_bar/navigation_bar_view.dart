import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/portfolio/portfolio_view.dart';
import 'package:provider/provider.dart';
import '../constant.dart';

class NavigationBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final onPressed = () => print('click');
    return MobileDesktopViewBuilder(
      mobileView: NavigationMobileView(),
      desktopView: NavigationDesktopView(),
    );
  }
}

class NavigationDesktopView extends StatelessWidget {
  const NavigationDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationItems = context.watch<List<NavigationItem>>();
    final scrollController = context.watch<ScrollController>();
    return Container(
      height: 100,
      width: kInitWidth,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          Image.asset('images/header_nav_logo.png'),
          Spacer(),
          for (var item in navigationItems)
            NavigationBarItem(
                onPressed: () {
                  scrollController.animateTo(
                    item.position,
                    duration: Duration(milliseconds: 700),
                    curve: Curves.easeInOut,
                  );
                },
                text: Text(
                  item.text,
                )),
        ],
      ),
    );
  }
}

class NavigationMobileView extends StatelessWidget {
  const NavigationMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        children: [
          SizedBox(width: 20),
          FlutterLogo(),
          Spacer(),
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ],
      ),
    );
  }
}
//we crearte a class to give the name for header

class NavigationBarItem extends StatelessWidget {
  //final isSmall = MediaQuery.of(context).size.width < 650;
  const NavigationBarItem({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final void Function() onPressed;
  final Text text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 64,
      ),
      child: InkWell(
        onTap: onPressed,
        mouseCursor: MaterialStateMouseCursor.clickable,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: text,
      ),
    );
  }
}

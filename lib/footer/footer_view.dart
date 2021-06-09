import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterudemyportfolio/utils/hover_extension.dart';

class FooterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: FooterMobileView(),
      desktopView: FooterDesktopView(),
    );
  }
}

class FooterDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Container(
      height: 100,
      width: kInitWidth,
      padding: kScreenPadding,
      child: Row(
        children: [
          Text(' ©<Adarsh Dwivedi>$currentYear --'),
          InkWell(
            child: Text(
              'See the source Code',
              style: TextStyle(decoration: TextDecoration.underline),
            ),
            mouseCursor: MaterialStateMouseCursor.clickable,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () => launch('https://github.com'),
          ),
          Spacer(),
          for (var social in socials)
            IconButton(
              icon: social.icon,
              onPressed: () => launch(social.url),
              color: Colors.redAccent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
            ).moveUpOnHover,
          SizedBox(
            width: 60,
          ),
        ],
      ),
    );
  }
}

class FooterMobileView extends StatelessWidget {
  final currentYear = DateTime.now().year;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: kScreenPadding,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                for (var social in socials)
                  IconButton(
                    icon: social.icon,
                    onPressed: () => launch(social.url),
                    color: Colors.redAccent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                  )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(' ©<Adarsh Dwivedi>$currentYear'),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Text(
                'See the source Code',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              mouseCursor: MaterialStateMouseCursor.clickable,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: () => launch('https://github.com'),
            ),
          ],
        ));
  }
}

class SociaInfo {
  final Widget icon;
  final String url;

  SociaInfo({@required this.icon, @required this.url});
}

final socials = [
  SociaInfo(
    icon: FaIcon(FontAwesomeIcons.facebook),
    url: 'https://www.facebook.com',
  ),
  SociaInfo(
    icon: FaIcon(FontAwesomeIcons.instagram),
    url: 'https://www.instagram.com',
  ),
  SociaInfo(
    icon: FaIcon(FontAwesomeIcons.linkedinIn),
    url: 'https://www.linkedin.com',
  ),
];

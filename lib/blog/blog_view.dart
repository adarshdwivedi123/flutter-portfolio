import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/desktop_view_builder.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/component/mobile_view_builder.dart';
import 'package:flutterudemyportfolio/experience/experience_container.dart';

class BlogView extends StatelessWidget {
  const BlogView({
    Key key,
  }) : super(key: key);
  static const title = "Blog";
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: BlogMobileView(),
      desktopView: BlogDesktoView(),
    );
  }
}

class BlogDesktoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: BlogView.title,
      children: [
        Row(
          children: [for (var i = 0; i < 2; i++) Expanded(child: BlogCard())],
        )
      ],
    );
  }
}

class BlogCard extends StatelessWidget {
  const BlogCard({
    Key key,
    this.isMobile,
  }) : super(key: key);
  final isMobile;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.redAccent,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: isMobile ?? false ? 20 : 40,
            ),
            child: Text(
              'How to  build a portfolio',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2 January 2020',
                  style: textStyle(
                    isGrrey: true,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Hello World thank you.' * 30,
                  style: textStyle(
                    isGrrey: true,
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BlogMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: BlogView.title,
      children: [
        for (var i = 0; i < 2; i++)
          BlogCard(
            isMobile: true,
          )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/constant.dart';

class DesktopViewBuilder extends StatelessWidget {
  final String titleText;
  final List<Widget> children;

  const DesktopViewBuilder(
      {Key key, @required this.titleText, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kInitWidth,
      padding: kScreenPadding,
      //color: Colors.yellow,
      child: Column(
        children: [
          Text(titleText, style: Theme.of(context).textTheme.headline2),
          ...children,
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutterudemyportfolio/utils/hover_extension.dart';

class HeaderBody extends StatelessWidget {
  final bool isMobile;
  const HeaderBody({
    Key key,
    this.isMobile = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'I\' m  a Mobile',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        AutoSizeText(
          'Developer </>',
          style: Theme.of(context).textTheme.headline2,
          maxLines: 1,
        ),
        SizedBox(
          height: isMobile ?? false ? 20 : 37,
        ),
        AutoSizeText(
          'Hi I Am Adarsh Dwivedi '
          ' I have 3 month of  experience in  Android With Core Java,'
          '  And I have Basic Knowlwdge of flutter and Dart I Am very Passionate About Android App Development',
          style: TextStyle(fontSize: 24),
          maxLines: 3,
        ),
        SizedBox(
          height: isMobile ?? false ? 20 : 40,
        ),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
          ),
          color: Colors.redAccent,
          onPressed: () => launch(
              'mailto:adarsh.alld100@gmail.com?subject=<subject>&body=<body>'),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: isMobile ?? false ? 10 : 17,
              horizontal: isMobile ?? false ? 8 : 15,
            ),
            child: Text(
              'Contact me',
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                color: Colors.white,
              ),
            ),
          ),
        ).moveUpOnHover,
      ],
    );
  }
}

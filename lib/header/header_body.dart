import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
          'I have 2  years of experience in mobile  development in building  beautiful ',
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
          onPressed: () {},
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
        ),
      ],
    );
  }
}

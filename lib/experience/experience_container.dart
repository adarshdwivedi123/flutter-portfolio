import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/utils/color_assets.dart';

class ExperienceContainer extends StatelessWidget {
  const ExperienceContainer({
    Key key,
    @required this.experience,
    @required this.index,
  }) : super(key: key);

  final ExperienceInfo experience;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colors = ColourAssets.all;
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 3,

          color: colors.elementAt(index % colors.length),
          //  color: ColourAssets.all.elementAt(index % colors.length),
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            experience.company,
            style: textStyle(isBold: true),
          ),
          Text(
            experience.timeline,
            style: textStyle(),
          ),
          for (var item in experience.description)
            Text(
              item,
              style: textStyle(),
            )
        ],
      ),
    );
  }
}

TextStyle textStyle({bool isBold, bool isGrrey}) {
  return TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: isBold ?? false ? FontWeight.bold : FontWeight.normal,
  );
}

class ExperienceInfo {
  final String company;
  final String timeline;
  final List<String> description;

  ExperienceInfo({
    @required this.company,
    @required this.timeline,
    @required this.description,
  });
}

final experiences = [
  ExperienceInfo(
    company: 'Android developer Intern (Start Up)',
    timeline: 'June 2020 -sep 2020 (3 months)',
    description: [
      '- Working on existing appp',
      '- modify the UI Part Of the App',
      '- Work in a team of 2 developers',
    ],
  ),
  ExperienceInfo(
    company: '0nline Training',
    timeline: ' April 2020 – May 2020 | 2 month | CSI IEEE',
    description: [
      '- Learn Android With Firebase.'
          '- Learn How To use differnt Layout and How to use dialog box.'
          '- With The Help of firebase login and authenticate the user and debugging the app.'
    ],
  ),
  ExperienceInfo(
    company: 'INDUSTRIAL EXPOSURE',
    timeline: 'NETCAMP PRIVATE LIMITED | 20 days | Android With Core Java',
    description: [
      '-In this Training I Learn Android With Core Java give the basic idea of android.'
          '- what are the diffculties facing anyone during making a android app'
    ],
  ),
  ExperienceInfo(
    company: 'Udemy Courses',
    timeline: 'Hitesh Choudray',
    description: [
      '- Learn  Flutter And Dart',
    ],
  ),
];

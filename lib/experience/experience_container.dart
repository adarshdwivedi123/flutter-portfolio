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
    company: 'Android developer Intern (Start Up)',
    timeline: 'June 2020 -sep 2020 (3 months)',
    description: [
      '- Working on existing appp',
      '- modify the UI Part Of the App',
      '- Work in a team of 2 developers',
    ],
  ),
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
    company: 'Android developer Intern (Start Up)',
    timeline: 'June 2020 -sep 2020 (3 months)',
    description: [
      '- Working on existing appp',
      '- modify the UI Part Of the App',
      '- Work in a team of 2 developers',
    ],
  ),
];

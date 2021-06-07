import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/desktop_view_builder.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';

import 'package:flutterudemyportfolio/skill/OutlineSkillContainer.dart';

class SkillsView extends StatelessWidget {
  static const Title = 'Skills';
  // const SkillsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MobileDesktopViewBuilder(
      desktopView: SkillsDesktopView(),
      mobileView: SkillsMobileView(),
      showMobile: width < 789,
    );
  }
}

class SkillsDesktopView extends StatelessWidget {
  const SkillsDesktopView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: SkillsView.Title,
      children: [
        SizedBox(
          height: 20,
        ),
        for (var rowIndex = 0; rowIndex < skills.length / 4; rowIndex++)
          Row(
            children: [
              for (var index = 0; index < skills.length / 2; index++)
                Expanded(
                  child:
                      OutlineSkillContainer(index: index, rowIndex: rowIndex),
                ),
            ],
          ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }
}

class SkillsMobileView extends StatelessWidget {
  const SkillsMobileView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(titleText: 'Skills', children: [
      for (var index = 0; index < skills.length; index++)
        OutlineSkillContainer(
          index: index,
          isMobile: true,
        ),
      SizedBox(
        height: 10,
      ),
    ]);
  }
}

final skills = [
  'Flutter',
  'Firebase',
  'Android',
  'Java',
  'C++',
  'XML',
  'DBMS',
  'D.S'
];

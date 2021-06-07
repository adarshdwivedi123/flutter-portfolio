import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/skill/skills_view.dart';
import 'package:flutterudemyportfolio/utils/color_assets.dart';

class OutlineSkillContainer extends StatelessWidget {
  const OutlineSkillContainer(
      {Key key, @required this.index, this.rowIndex, this.isMobile})
      : super(key: key);

  final int index;
  final int rowIndex;
  final bool isMobile;
  final colors = ColourAssets.all;

  @override
  Widget build(BuildContext context) {
    final parsedIndex = isMobile ?? false ? index : (index * 2) + rowIndex;
    return Padding(
      padding: EdgeInsets.only(left: index != 0 ? 8.0 : 0),
      child: Container(
        width: isMobile ?? false ? double.infinity : null,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(
              width: 3,
              color: ColourAssets.all.elementAt(index % colors.length),
            ),
            borderRadius: BorderRadius.circular(3)),
        child: Text(
          skills.elementAt(parsedIndex),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/component/desktop_view_builder.dart';
import 'package:flutterudemyportfolio/component/mobile_desktop_view_builder.dart';
import 'package:flutterudemyportfolio/component/mobile_view_builder.dart';

class ProjectItem {
  final String image;
  final String title;
  final String description;
  final List<String> technologies;

  ProjectItem(
      {@required this.image,
      @required this.title,
      @required this.description,
      @required this.technologies});
}

final kProjectItems = [
  ProjectItem(
      image: 'images/music.png',
      title: 'music app',
      description: 'music app that play and pause the song  in this app  ',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
      image: 'images/music.png',
      title: 'music app',
      description: 'music app that play and pause the song  in this app  ',
      technologies: ['Flutter', 'Firebase']),
  ProjectItem(
      image: 'images/music.png',
      title: 'music app',
      description: 'music app that play and pause the song  in this app  ',
      technologies: ['Flutter', 'Firebase'])
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const Title = 'Skills';
  @override
  Widget build(BuildContext context) {
    return MobileDesktopViewBuilder(
      mobileView: ProjectMobileView(),
      desktopView: ProjectDesktopView(),
    );
  }
}

class ProjectDesktopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DesktopViewBuilder(
      titleText: ProjectView.Title,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            for (final item in kProjectItems)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProjectItembody(item: item),
                ),
              )
          ],
        ),
        SizedBox(
          height: 70,
        )
      ],
    );
  }
}

class ProjectItembody extends StatelessWidget {
  const ProjectItembody({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProjectItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(item.image),
        SizedBox(
          height: 15,
        ),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          item.description,
          style: TextStyle(fontSize: 17),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            for (final tech in item.technologies)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Chip(label: Text(tech)),
              )
          ],
        ),
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}

class ProjectMobileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MobileViewBuilder(
      titleText: ProjectView.Title,
      children: [
        for (final item in kProjectItems) ProjectItembody(item: item),
      ],
    );
  }
}

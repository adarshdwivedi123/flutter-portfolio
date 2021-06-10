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
      image: 'images/corona.jpeg',
      title: 'corona app',
      description:
          'covid-19 app to know the exact data about coronavirus in any'
          'specific-country how many death recover and active cases in India from  the coronavirus ',
      technologies: ['Java', 'Android', 'API', 'Xml']),
  ProjectItem(
      image: 'images/music.png',
      title: 'music app',
      description:
          ' Music Player App at  a run time read the song from the phone '
          'display the song in the form list on click on particular song then it move to '
          'second screen and then song is play and pause',
      technologies: ['Java', 'Android']),
  ProjectItem(
      image: 'images/shyari.jpeg',
      title: 'shyari app',
      description:
          ' display the  Diffrent type of shayri in the from listview fetching the shayri '
          ' from the firebase  and storing the shayri in Firebase '
          'use Material Design to  Decorate My App',
      technologies: ['Java', 'Firebase']),
  ProjectItem(
      image: 'images/portfolio.png',
      title: 'Portfolio app',
      description:
          ' Portfolio App  To ShowCase My skills , Experience and Project with the help of '
          ' This App  i am creating using Flutter  and Dart this App can run in both mobile and in web',
      technologies: ['Flutter', 'Firebase'])
];

class ProjectView extends StatelessWidget {
  const ProjectView({
    Key key,
  }) : super(key: key);
  static const Title = 'Project';
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

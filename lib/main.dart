import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/blog/blog_view.dart';
import 'package:flutterudemyportfolio/experience/experience_view.dart';
import 'package:flutterudemyportfolio/navigation_bar/navigation_bar_view.dart';
import 'package:flutterudemyportfolio/project/project_view.dart';
import 'package:flutterudemyportfolio/skill/skills_view.dart';
import 'drawer/drawer_view.dart';
import 'header/header_view.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:after_layout/after_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Adarsh Dwivedi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline2: GoogleFonts.montserrat(
            color: Colors.black,
          ),
          headline4: GoogleFonts.montserrat(
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),
      home: PortfolioView(),
    );
  }
}

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 0);

  @override
  void afterFirstLayout(BuildContext context) {
    final projectPosition = _getPositions(projectKey);
    print(projectPosition);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print(height);
    final ScrollController scrollController =
        ScrollController(initialScrollOffset: 1750);
    return Scaffold(
      endDrawer: Drawerview(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            NavigationBarView(),
            HeaderView(),
            ProjectView(key: projectKey),
            SkillsView(key: skillsKey),
            ExperienceView(key: experienceKey),
            BlogView(key: blogKey),
            Container(
              height: height,
              width: width,
              color: Colors.blue,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            scrollController.animateTo(
              0,
              duration: Duration(milliseconds: 700),
              curve: Curves.easeInOut,
            );
          }),
    );
  }
}

double _getPositions(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}

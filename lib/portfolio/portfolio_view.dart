import 'package:flutter/material.dart';
import 'package:flutterudemyportfolio/drawer/drawer_view.dart';
import 'package:flutterudemyportfolio/footer/footer_view.dart';
import 'package:flutterudemyportfolio/header/header_view.dart';
import 'package:flutterudemyportfolio/portfolio/back_to_top_button.dart';

import 'package:provider/provider.dart';

import 'package:flutterudemyportfolio/blog/blog_view.dart';
import 'package:flutterudemyportfolio/experience/experience_view.dart';
import 'package:flutterudemyportfolio/navigation_bar/navigation_bar_view.dart';
import 'package:flutterudemyportfolio/project/project_view.dart';
import 'package:flutterudemyportfolio/skill/skills_view.dart';

import 'package:after_layout/after_layout.dart';

class PortfolioView extends StatefulWidget {
  @override
  _PortfolioViewState createState() => _PortfolioViewState();
}

class _PortfolioViewState extends State<PortfolioView> with AfterLayoutMixin {
  final projectKey = GlobalKey();
  final skillsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final blogKey = GlobalKey();
  List<NavigationItem> navigationItems = [];

  final ScrollController scrollController =
      ScrollController(initialScrollOffset: 1750);

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      navigationItems = [
        NavigationItem('Projects', key: projectKey),
        NavigationItem('Skills', key: skillsKey),
        NavigationItem('Experiences', key: experienceKey),
        NavigationItem('Blog', key: blogKey),
      ];
    });

    final projectPosition = _getPosition(projectKey);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MultiProvider(
      providers: [
        ProxyProvider0<List<NavigationItem>>(update: (_, __) {
          return navigationItems;
        }),
        ChangeNotifierProvider<ScrollController>(create: (_) {
          return scrollController;
        }),
      ],
      child: Scaffold(
        endDrawer: Drawerview(),
        body: SizedBox(
          width: width,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                NavigationBarView(),
                HeaderView(),
                ProjectView(key: projectKey),
                SkillsView(key: skillsKey),
                ExperienceView(key: experienceKey),
                FooterView(),
                BlogView(key: blogKey),
              ],
            ),
          ),
        ),
        floatingActionButton: BackToTopBottom(),
      ),
    );
  }
}

class NavigationItem {
  final String text;
  final GlobalKey key;

  NavigationItem(this.text, {@required this.key});
  double get position => _getPosition(key);
}

double _getPosition(GlobalKey key) {
  final RenderBox renderBox = key.currentContext.findRenderObject();
  final position = renderBox.localToGlobal(Offset.zero);
  final scrollOffset = position.dy;
  return scrollOffset;
}

import 'package:flutter/material.dart';

import 'package:flutterudemyportfolio/portfolio/portfolio_view.dart';

import 'package:google_fonts/google_fonts.dart';

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

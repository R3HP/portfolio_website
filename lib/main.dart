import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/routes/route_information_parser.dart';
import 'package:portfolio_app/routes/router_delegate.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          primaryColor: primaryColor,
          backgroundColor: bgColor,
          canvasColor: bgColor,
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white)
              .copyWith(
                  bodyText1: const TextStyle(color: bodyTextColor),
                  bodyText2: const TextStyle(color: bodyTextColor))),
      routeInformationParser: ProjectRouteInformationParser(),
      routerDelegate: ProjectRouterDelegate(),
      
    );
  }
}
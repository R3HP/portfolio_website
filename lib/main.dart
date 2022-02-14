import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/constants.dart';
import 'package:portfolio_app/view/home_screen.dart';
import 'package:portfolio_app/view/sections/details_screen/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const HomeScreen(),
      // routes: {
      //   ProjectDetailsScreen.routeName :(context) => const ProjectDetailsScreen()
      // },
      onGenerateRoute: (setting){
        if(setting.name!.contains('/details')){
          final arguments =setting.name!.split('?id=');
          return MaterialPageRoute(builder: ((context) => ProjectDetailsScreen(projectId: arguments[1],)),);
        }
      },
    );
  }
}
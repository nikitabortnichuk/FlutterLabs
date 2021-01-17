import 'package:chwitter/component/Movies.dart';
import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/model/LikedChweetListModel.dart';
import 'package:chwitter/model/MovieListModel.dart';
import 'package:chwitter/model/ThemePreference.dart';
import 'package:chwitter/screen/HomeScreen.dart';
import 'package:chwitter/screen/MoviesDetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/DI.dart';

void main() {
  runApp(ChwitterApp());
}

class ChwitterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Chweet(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChweetListModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LikedChweetListModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieListModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemePreference(),
        )
      ],
      child: Consumer<ThemePreference> (
        builder: (BuildContext context, model, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: model.value
                ? ThemeData.dark()
                : ThemeData(
              primaryColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: '/' ,
            routes: {
              '/': (context) => HomeScreen(),
              '/movie': (context) => MovieDetailsScreen()
            },
          );
        }
      )
    );
  }
}

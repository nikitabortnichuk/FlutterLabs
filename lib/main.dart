import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/model/LikedChweetListModel.dart';
import 'package:chwitter/screen/HomeScreen.dart';
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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/model/LikedChweetListModel.dart';
import 'package:chwitter/screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'di/DI.dart';
import 'model/ChweetModel.dart';

void main() {
  runApp(ChwitterApp());
}

class ChwitterApp extends StatelessWidget {

  ChweetListModel _chweetListModel;

  ChwitterApp() {
    _getChweets();
  }

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChweetModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => _chweetListModel,
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

  void _getChweets() async {
    var response = await DI.remoteDataSource.getChweets();
    _chweetListModel = ChweetListModel(items: response);
  }
}

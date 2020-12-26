import 'package:chwitter/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

import 'di/DI.dart';
import 'model/Chweet.dart';

void main() {
  runApp(ChwitterApp());
}

class ChwitterApp extends StatefulWidget {
  @override
  _ChwitterAppState createState() => _ChwitterAppState();
}

class _ChwitterAppState extends State<ChwitterApp> {
  List<Chweet> _chweets = [];
  List<Chweet> _likedChweets = [];

  @override
  void initState() {
    _getChweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(
        chweets: _chweets,
        likedChweets: _likedChweets,
        addToLiked: addToLiked,
        removeFromLiked: removeFromLiked,
      ),
    );
  }

  void _getChweets() async {
    var response = await DI.remoteDataSource.getChweets();
    setState(() {
      _chweets = response;
    });
  }

  void addToLiked(Chweet chweet) {
    _likedChweets.add(chweet);
  }

  void removeFromLiked(Chweet chweet) {
    _likedChweets.remove(chweet);
  }
}

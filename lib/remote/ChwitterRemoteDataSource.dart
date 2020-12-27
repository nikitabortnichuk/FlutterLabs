
import 'dart:convert';

import 'package:chwitter/model/ChweetModel.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:flutter/services.dart';

abstract class RemoteDataSource {
  Future<List<ChweetModel>> getChweets();
}

class ChwitterRemoteDataSource extends RemoteDataSource{
  @override
  Future<List<ChweetModel>> getChweets() async {
    var response = await rootBundle.loadString('assets/json/chweets.json');
    return ChweetListModel.fromJson(json.decode(response)).items;
  }
}
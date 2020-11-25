
import 'dart:convert';

import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/ChweetResponse.dart';
import 'package:flutter/services.dart';

abstract class RemoteDataSource {
  Future<List<Chweet>> getChweets();
}

class ChwitterRemoteDataSource extends RemoteDataSource{
  @override
  Future<List<Chweet>> getChweets() async {
    var response = await rootBundle.loadString('assets/json/chweets.json');
    return ChweetResponse.fromJson(json.decode(response)).items;
  }
}
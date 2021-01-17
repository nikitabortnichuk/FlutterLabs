
import 'dart:convert';

import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/remote/AbstractRemoteDataSource.dart';
import 'package:flutter/services.dart';

class ChwitterRemoteDataSource extends RemoteDataSource<Chweet>{
  @override
  Future<List<Chweet>> getItems() async {
    var response = await rootBundle.loadString('assets/json/chweets.json');
    return ChweetListModel.fromJson(json.decode(response)).items;
  }
}
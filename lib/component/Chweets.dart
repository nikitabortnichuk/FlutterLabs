import 'package:chwitter/component/ChweetWidget.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:chwitter/model/ChweetModel.dart';
import 'package:chwitter/remote/ChwitterRemoteDataSource.dart';
import 'package:flutter/widgets.dart';

class Chweets extends StatelessWidget {

  ChweetListModel _chweetListModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chweets.length,
      itemBuilder: (context, index) {
        return ChweetWidget(
          chweet: chweets[index],
          addToLiked: addToLiked,
          removeFromLiked: removeFromLiked,
        );
      },
    );
  }

  ChweetListModel getChweets() {
    Future<List<ChweetModel>> chweetItemList = ChwitterRemoteDataSource().getChweets();
    return ChweetListModel(items: chweetItemList);
  }

}

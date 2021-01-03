import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/LikedChweetListModel.dart';
import 'package:flutter/widgets.dart';
import 'package:chwitter/component/ChweetWidget.dart';
import 'package:provider/provider.dart';

class Likes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LikedChweetListModel>(
      builder: (context, model, _) => ListView.builder(
        itemCount: model.items.length,
        itemBuilder: (context, index) {
          return ChweetWidget(
              chweet: model.items[index]
          );
        },
      ),
    );
  }
}

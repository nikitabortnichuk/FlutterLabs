import 'package:chwitter/component/ChweetWidget.dart';
import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/widgets.dart';

class Chweets extends StatelessWidget {
  final List<Chweet> chweets;
  final Function addToLiked;
  final Function removeFromLiked;

  Chweets(
      {@required this.chweets,
      @required this.addToLiked,
      @required this.removeFromLiked});

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
}

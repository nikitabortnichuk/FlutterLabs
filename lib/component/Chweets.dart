import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/screen/ChweetDetailsScreen.dart';
import 'package:chwitter/component/ChweetWidget.dart';
import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Chweets extends StatefulWidget {
  @override
  _ChweetsState createState() => _ChweetsState();
}

class _ChweetsState extends State<Chweets> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChweetListModel>(builder: (context, model, _) {
      return ListView.builder(
          itemCount: model.items.length,
          itemBuilder: (context, index) {
            Chweet chweet = model.getById(index);
            return GestureDetector(
                child: ChweetWidget(chweet: chweet),
                onTap: () async {
                  var textStyle = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ChweetDetailsWidget(chweet: chweet)
                      )
                  );
                  setState(() {
                    chweet.textStyle = textStyle;
                  });
                });
          });
    });
  }
}

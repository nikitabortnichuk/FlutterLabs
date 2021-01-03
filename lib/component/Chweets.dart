import 'package:chwitter/component/ChweetWidget.dart';
import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/ChweetListModel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Chweets extends StatefulWidget {
  @override
  _ChweetsState createState() => _ChweetsState();
}

class _ChweetsState extends State<Chweets> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChweetListModel>(
        builder: (context, model, _) => ListView.builder(
            itemCount: model.items.length,
            itemBuilder: (context, index) =>
                ChweetWidget(chweet: model.getById(index))
        )
    );
  }
}

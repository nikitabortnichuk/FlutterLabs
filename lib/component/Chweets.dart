
import 'package:chwitter/component/ChweetWidget.dart';
import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/widgets.dart';

class Chweets extends StatefulWidget {
  @override
  _ChweetsState createState() => _ChweetsState();
}

class _ChweetsState extends State<Chweets> {

  List<Chweet> _chweets = [];

  @override
  void initState() {
    _getTweets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _chweets.length,
      itemBuilder: (context, index) {
        return ChweetWidget(chweet: _chweets[index]);
      },
    );
  }

  void _getTweets() async {
    var response = await DI.remoteDataSource.getChweets();
    setState(() {
      _chweets = response;
    });
  }
}

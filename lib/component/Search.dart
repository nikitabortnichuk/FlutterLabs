
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Search",
        style: TextStyle(
            fontSize: 24
        ),
      ),
    );
  }
}

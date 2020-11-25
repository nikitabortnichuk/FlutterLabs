import 'package:flutter/widgets.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Messages",
        style: TextStyle(
          fontSize: 24
        ),
      ),
    );
  }
}

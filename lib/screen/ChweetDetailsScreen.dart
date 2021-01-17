import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ChweetDetailsWidget extends StatelessWidget {
  final Chweet chweet;

  ChweetDetailsWidget({Key key, this.chweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, Colors.purple);
          },
        ),
      ),
      body: Container(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(200)),
                      child: Image.asset(chweet.image, width: 80)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              chweet.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(chweet.account,
                                  style: TextStyle(fontSize: 18)),
                            )
                          ],
                        ),
                        Text(
                          chweet.message,
                          style: TextStyle(fontSize: 18),
                        ),
                        if (chweet.media != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8, right: 8),
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(12)),
                              child: Image.network(
                                chweet.media,
                                width: 500,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Divider(),
        ]),
      ),
    );
  }
}

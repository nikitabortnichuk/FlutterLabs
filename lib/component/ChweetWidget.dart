import 'package:chwitter/model/Chweet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChweetWidget extends StatelessWidget {
  final Chweet chweet;

  const ChweetWidget({Key key, this.chweet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  child: Image.asset(chweet.image, width: 60)),
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
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(chweet.account),
                        )
                      ],
                    ),
                    Html(data: chweet.message),
                    if (chweet.media != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                            chweet.media,
                            width: 300,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SvgPicture.asset(
                                  "assets/icons/reply.svg",
                                  width: 20,
                                  height: 20,
                                ),
                            ),
                            ),
                          Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/retweet.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(chweet.rechweet.toString()),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/like.svg",
                                    width: 20,
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(chweet.fav.toString()),
                                  )
                                ],
                              )
                          ),
                          Expanded(
                              child:
                                  SvgPicture.asset(
                                      "assets/icons/share.svg",
                                      width: 20,
                                      height: 20,
                                  ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

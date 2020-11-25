import 'package:flutter/widgets.dart';

class ChwitterDrawerHeader extends StatelessWidget {
  final String image;
  final String account;
  final String name;
  final int followings;
  final int followers;

  const ChwitterDrawerHeader(
      {Key key,
      this.image,
      this.account,
      this.name,
      this.followings,
      this.followers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(200)),
                  child: Image.asset(this.image, width: 60)),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text('@${this.account}'),
                    ),
                  ],
                ),
              )
            ]),
            Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(this.followings.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                        child: Text("Followings", style: TextStyle(fontSize: 14))),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Text(this.followers.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    Text("Followers", style: TextStyle(fontSize: 14)),
                  ],
                ))
          ]),
    );
  }
}

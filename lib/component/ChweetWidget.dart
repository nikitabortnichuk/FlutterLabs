import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/LikedChweetListModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ChweetWidget extends StatefulWidget {
  final Chweet chweet;

  ChweetWidget({Key key, this.chweet}) : super(key: key);

  @override
  _ChweetWidgetState createState() => _ChweetWidgetState();
}

class _ChweetWidgetState extends State<ChweetWidget> {

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
                  child: Image.asset(widget.chweet.image, width: 60)),
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
                          widget.chweet.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(widget.chweet.account),
                        )
                      ],
                    ),
                    Text(widget.chweet.message, style: TextStyle(color: widget.chweet.textStyle)),
                    if (widget.chweet.media != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8, right: 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.network(
                            widget.chweet.media,
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
                          GestureDetector(
                            onTap: _onTapLike,
                            child: SvgPicture.asset(
                              widget.chweet.isLiked
                                  ? "assets/icons/like_colored.svg"
                                  : "assets/icons/like.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(widget.chweet.fav.toString()),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onTapLike() {
    final model = Provider.of<LikedChweetListModel>(context, listen: false);
    setState(() {
      if (widget.chweet.isLiked) {
        widget.chweet.fav--;
        model.removeFromLiked(widget.chweet);
      } else {
        widget.chweet.fav++;
        model.addToLiked(widget.chweet);
      }
      widget.chweet.isLiked = !widget.chweet.isLiked;
    });
  }
}

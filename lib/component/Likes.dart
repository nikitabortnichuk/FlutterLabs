import 'package:chwitter/model/ChweetModel.dart';
import 'package:flutter/widgets.dart';
import 'package:chwitter/component/ChweetWidget.dart';

class Likes extends StatefulWidget {
  final List<ChweetModel> likedChweets;
  final Function addToLiked;
  final Function removeFromLiked;

  Likes(
      {@required this.likedChweets,
      @required this.addToLiked,
      @required this.removeFromLiked});

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.likedChweets.length,
      itemBuilder: (context, index) {
        print(widget.likedChweets[index].fav);
        return ChweetWidget(
            chweet: widget.likedChweets[index],
            addToLiked: widget.addToLiked,
            removeFromLiked: _removeFromLiked);
      },
    );
  }

  _removeFromLiked(ChweetModel chweet) {
    setState(() {
      widget.removeFromLiked(chweet);
    });
  }
}


import 'package:chwitter/model/Movie.dart';
import 'package:flutter/widgets.dart';

class MovieWidget extends StatelessWidget {

  final Movie movie;

  MovieWidget({Key key, this.movie}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0, left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(
                  movie.image,
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              movie.title,
              style: TextStyle(fontSize: 24),
            )
          ],
        ),
      ),
    );
  }
}
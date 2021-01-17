import 'package:chwitter/component/MovieWidget.dart';
import 'package:chwitter/di/DI.dart';
import 'package:chwitter/model/Movie.dart';
import 'package:chwitter/model/MovieListModel.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  Future<List<Movie>> _movieList = DI.movieRemoteDataSource.getItems();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _movieList,
      builder: (context, s) {
        if (s.hasData) {
          return ListView.builder(
              itemCount: s.data.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: MovieWidget(movie: s.data[index]),
                  onTap: () => Navigator.pushNamed(context, "/movie", arguments: s.data[index]),
                );
              });
        } else {
          return Container(
            alignment: Alignment.center,
            child: Text("Loading..."),
          );
        }
      },
    );
  }
}

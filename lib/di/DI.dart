import 'package:chwitter/model/Chweet.dart';
import 'package:chwitter/model/Movie.dart';
import 'package:chwitter/remote/AbstractRemoteDataSource.dart';
import 'package:chwitter/remote/ChwitterRemoteDataSource.dart';
import 'package:chwitter/remote/MovieRemoteDataSource.dart';

class DI {
  static final RemoteDataSource<Chweet> chweetRemoteDataSource = ChwitterRemoteDataSource();
  static final RemoteDataSource<Movie> movieRemoteDataSource = MovieRemoteDataSource();
}
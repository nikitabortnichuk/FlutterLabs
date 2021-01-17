
class Movie {

  int _id;
  String _title;
  String _image;

  static const imageUrl = "https://image.tmdb.org/t/p/w500";

  int get id => _id;
  String get title => _title;
  String get image => _image;

  Movie({id, title, image});

  Movie.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _image = imageUrl + json["poster_path"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["poster_path"] = _image.replaceFirst(imageUrl, "");
    return map;
  }

  @override
  String toString() {
    return 'Movie{_id: $_id, _title: $_title, _image: $_image}';
  }
}
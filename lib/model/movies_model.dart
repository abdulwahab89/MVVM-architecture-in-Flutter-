import 'dart:convert';

/// id : 1
/// movie : "The Shawshank Redemption"
/// rating : 9.2
/// image : "images/shawshank.jpg"
/// imdb_url : "https://www.imdb.com/title/tt0111161/"

MoviesModel moviesModelFromJson(String str) =>
    MoviesModel.fromJson(json.decode(str));
String moviesModelToJson(MoviesModel data) => json.encode(data.toJson());

class MoviesModel {
  MoviesModel({
    dynamic? id,
    String? movie,
    dynamic? rating,
    String? image,
    String? imdbUrl,
  }) {
    _id = id;
    _movie = movie;
    _rating = rating;
    _image = image;
    _imdbUrl = imdbUrl;
  }

  MoviesModel.fromJson(dynamic json) {
    _id = json['id'];
    _movie = json['movie'];
    _rating = json['rating'];
    _image = json['image'];
    _imdbUrl = json['imdb_url'];
  }
  dynamic? _id;
  String? _movie;
  dynamic? _rating;
  String? _image;
  String? _imdbUrl;
  MoviesModel copyWith({
    dynamic? id,
    String? movie,
    dynamic? rating,
    String? image,
    String? imdbUrl,
  }) =>
      MoviesModel(
        id: id ?? _id,
        movie: movie ?? _movie,
        rating: rating ?? _rating,
        image: image ?? _image,
        imdbUrl: imdbUrl ?? _imdbUrl,
      );
  dynamic? get id => _id;
  String? get movie => _movie;
  dynamic? get rating => _rating;
  String? get image => _image;
  String? get imdbUrl => _imdbUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['movie'] = _movie;
    map['rating'] = _rating;
    map['image'] = _image;
    map['imdb_url'] = _imdbUrl;
    return map;
  }
}

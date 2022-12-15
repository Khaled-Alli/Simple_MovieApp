class MovieModel {
  late List<Movie> movies = [];

  MovieModel.fromJson(Map<String, dynamic> json) {
    json["results"].forEach((v) => movies.add(Movie.fromJson(v)));
  }
}

class Movie {
  late bool adult;
  late String backdropPath;
  late List<int> genreIds = [];
  late int id;
  late String language;
  late String name;
  late String overview;
  late String posterImage;
  late String releaseDate;
  late var rate;

  Movie.fromJson(Map<String, dynamic> json) {
    this.adult = json["adult"];
    this.backdropPath = json["backdrop_path"];
    json["genre_ids"].forEach((v) => genreIds.add(v));
    this.id = json["id"];
    this.language = json["original_language"];
    this.name = json["title"];
    this.overview = json["overview"];
    this.posterImage = json["poster_path"];
    this.releaseDate = json["release_date"];
    this.rate = json["vote_average"];
  }
}

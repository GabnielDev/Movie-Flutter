// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  Movie({
     this.page,
     this.results,
     this.totalPages,
     this.totalResults,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  Result({
     this.backdropPath,
     this.id,
     this.originalTitle,
     this.overview,
     this.posterPath,
     this.title,
  });

  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? title;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "title": title,
      };
}

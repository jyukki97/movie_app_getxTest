class Movie {
  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.summary,
    required this.descriptionFull,
    required this.backgroundImage,
    required this.smallCoverImage,
    required this.largeCoverImage,
    required this.genres,
  });
  late int id;
  late String title;
  late int year;
  late double rating;
  late int runtime;
  late String summary;
  late String descriptionFull;
  late String backgroundImage;
  late String smallCoverImage;
  late String largeCoverImage;
  List<String> genres = <String>[];

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rating = json['rating'].toDouble();
    runtime = json['runtime'];
    summary = json['summary'];
    descriptionFull = json['description_full'];
    backgroundImage = json['background_image'];
    smallCoverImage = json['small_cover_image'];
    largeCoverImage = json['large_cover_image'];

    if (json['genres'] != null) {
      json['genres'].forEach((v) {
        genres.add(v);
      });
    }
  }
}
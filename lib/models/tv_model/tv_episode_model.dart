class TVEpisodeModel {
  String? airDate;
  List<Crew>? crew;
  int? episodeNumber;
  List<GuestStars>? guestStars;
  String? name;
  String? overview;
  int? id;
  String? productionCode;
  int? runtime;
  int? seasonNumber;
  String? stillPath;
  double? voteAverage;
  int? voteCount;

  TVEpisodeModel(
      {this.airDate,
        this.crew,
        this.episodeNumber,
        this.guestStars,
        this.name,
        this.overview,
        this.id,
        this.productionCode,
        this.runtime,
        this.seasonNumber,
        this.stillPath,
        this.voteAverage,
        this.voteCount});

  TVEpisodeModel.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    if (json['crew'] != null) {
      crew = <Crew>[];
      json['crew'].forEach((v) {
        crew!.add(new Crew.fromJson(v));
      });
    }
    episodeNumber = json['episode_number'];
    if (json['guest_stars'] != null) {
      guestStars = <GuestStars>[];
      json['guest_stars'].forEach((v) {
        guestStars!.add(new GuestStars.fromJson(v));
      });
    }
    name = json['name'];
    overview = json['overview'];
    id = json['id'];
    productionCode = json['production_code'];
    runtime = json['runtime'];
    seasonNumber = json['season_number'];
    stillPath = json['still_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    if (this.crew != null) {
      data['crew'] = this.crew!.map((v) => v.toJson()).toList();
    }
    data['episode_number'] = this.episodeNumber;
    if (this.guestStars != null) {
      data['guest_stars'] = this.guestStars!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['id'] = this.id;
    data['production_code'] = this.productionCode;
    data['runtime'] = this.runtime;
    data['season_number'] = this.seasonNumber;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Crew {
  String? job;
  String? department;
  String? creditId;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;

  Crew(
      {this.job,
        this.department,
        this.creditId,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath});

  Crew.fromJson(Map<String, dynamic> json) {
    job = json['job'];
    department = json['department'];
    creditId = json['credit_id'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['job'] = this.job;
    data['department'] = this.department;
    data['credit_id'] = this.creditId;
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class GuestStars {
  String? character;
  String? creditId;
  int? order;
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;

  GuestStars(
      {this.character,
        this.creditId,
        this.order,
        this.adult,
        this.gender,
        this.id,
        this.knownForDepartment,
        this.name,
        this.originalName,
        this.popularity,
        this.profilePath});

  GuestStars.fromJson(Map<String, dynamic> json) {
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['original_name'] = this.originalName;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}
import 'package:dio/dio.dart';
import 'package:movie_app/constants/constants.dart';

class Network {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: apiBaseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 1000 * 20,
      receiveTimeout: 1000 * 20,
    ),
  );

  static Future<Response> getNowPlayingMovies() async {
    return dio.get("$movie$nowPlayingEndPoint$apiKey");
  }

  static Future<Response> getTopRatedMovies() async {
    return dio.get("$movie$topRatedEndPoint$apiKey");
  }

  static Future<Response> getPopularMovies() async {
    return dio.get("$movie$popularEndPoint$apiKey");
  }

  static Future<Response> getMovieDetailsMovies(int id) async {
    return dio.get("$apiBaseUrl$movie/$id$apiKey");
  }

  static Future<Response> getSimilarMovies(int id) async {
    return dio.get("$apiBaseUrl$movie/$id/similar$apiKey");
  }



  static Future<Response> getOnAirTV() async {
    return dio.get("$tv$onAirEndPoint$apiKey");
  }

  static Future<Response> getTopRatedTVs() async {
    return dio.get("$tv$topRatedEndPoint$apiKey");
  }

  static Future<Response> getPopularTV() async {
    return dio.get("$tv$popularEndPoint$apiKey");
  }

  static Future<Response> getTVDetails(int? id) async {
    return dio.get("$apiBaseUrl$tv/$id$apiKey");
  }

  static Future<Response> getSimilarTV(int? id) async {
    return dio.get("$apiBaseUrl$tv/$id/similar$apiKey");
  }

  static Future<Response> getTVSeason({required tv_id,required seasonNumber }) async {
    return dio.get("$apiBaseUrl$tv${creatSeasonURL(numOfSeason: seasonNumber, TV_ID: tv_id)}$apiKey");
  }

  static Future<Response> getTVEpisode({required tv_id,required seasonNumber ,required episodNumber}) async {
    return dio.get("$apiBaseUrl$tv${creatEpisodesURL(numOfSeason: seasonNumber, numOfEpisodes: episodNumber, TV_ID: tv_id)}$apiKey");
  }


}
//
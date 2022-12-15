import '../components/shared.dart';

String apiBaseUrl="https://api.themoviedb.org/3";
String apiKey="?api_key=c821a57ba4433c853ab25320c5247fc9";
String nowPlayingEndPoint="/now_playing";
String topRatedEndPoint="/top_rated";
String popularEndPoint="/popular";
String onAirEndPoint="/on_the_air";
String imageBaseUrl ="https://image.tmdb.org/t/p/w500";
String movie ="/movie";
String tv ="/tv";

//String apiTVBaseUrl="https://api.themoviedb.org/3/tv";

String creatSeasonURL({required numOfSeason,required TV_ID}){

  return "/$TV_ID/season/${handleSeasonNumber(numOfSeason)}";
}
String creatEpisodesURL({required numOfSeason,required numOfEpisodes,required TV_ID}){
  return "/$TV_ID/season//$numOfSeason/episode/$numOfEpisodes";
}




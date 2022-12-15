import 'package:bloc/bloc.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/screens/tv/tv_home.dart';

import '../../constants/core/dio.dart';
import '../../models/movie_model/details_movie_model.dart';
import '../../models/movie_model/movieModel.dart';
import '../../models/movie_model/silmilar_model.dart';
import '../../screens/movies/moives_home.dart';
class MovieCubit extends Cubit<MovieState>
{
  MovieCubit():super(InitialState());

  MovieModel? nowPlaying;
  MovieModel? topRated;
  MovieModel? popular;
  DetailsModel? movieDetails;
  SimilarModel? similarMovies;

  int appLayoutIndex=0;

  List layout =
  [
    MoivesHome(),
    TV_Home(),
  ];

  void getMovieDetails(int id){
    try{
      Network.getMovieDetailsMovies(id).then((value)  =>
      movieDetails = DetailsModel.fromJson(value.data)
      ).then((value) => emit(GetMovieDetails()));
    }catch(e){print(e.toString());}
  }

  void getSimilarMovies(int id){
    try{
      Network.getSimilarMovies(id).then((value)
      => similarMovies = SimilarModel.fromJson(value.data)
      ).then((value) => emit(GetSimilarMovies()));
    }catch(e){print(e.toString());}
  }

  void getMovies(){
    try{
      Network.getNowPlayingMovies().then((value)  => nowPlaying = MovieModel.fromJson(value.data)
       ).then((value) => emit(GetMoviesState()) );
    }catch(e){print(e.toString());}
  }

  void getTopRatedList(){
    Network.getTopRatedMovies().then((value)  => topRated = MovieModel.fromJson(value.data)
    ).then((value) =>emit(GetTopRatedList()) );
  }

  void getPopularList(){
    Network.getPopularMovies().then((value)  => popular = MovieModel.fromJson(value.data)
    ).then((value) =>emit(GetPopularList()) );
  }

   updateLayoutIndex(int index)
  {
    appLayoutIndex=index;
    emit(UpdateLayoutInde());
  }

  String extractGenres(List<Genres>? genres){
   String output="";
    genres?.forEach((element) {output+=" "+element.name.toString()+".";});
    return output;
  }
}
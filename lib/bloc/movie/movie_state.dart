import 'package:bloc/bloc.dart';
abstract class MovieState {}
class InitialState extends MovieState{}

class GetMoviesState extends MovieState{}
class GetTopRatedList extends MovieState{}
class GetPopularList extends MovieState{}
class UpdateLayoutInde extends MovieState{}
class GetMovieDetails extends MovieState{}
class GetSimilarMovies extends MovieState{}

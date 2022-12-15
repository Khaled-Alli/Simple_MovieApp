import 'package:bloc/bloc.dart';
abstract class TVState {}
class InitialState extends TVState{}
class GetOnAirTV extends TVState{}
class GetPopularTV extends TVState{}
class GetTopRatedTV extends TVState{}
class GetSimilarTV extends TVState{}
class GetSeasonTV extends TVState{}
class GetEpisondTV extends TVState{}
class GetDetailsTV extends TVState{}
class UpdateDropDownValue extends TVState{}

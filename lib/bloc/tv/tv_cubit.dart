import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart%20';
import 'package:movie_app/bloc/tv/tv_state.dart';
import 'package:movie_app/components/shared.dart';
import 'package:movie_app/models/movie_model/silmilar_model.dart';
import 'package:movie_app/models/tv_model/tv_episode_model.dart';
import 'package:movie_app/models/tv_model/tv_model.dart';
import 'package:movie_app/models/tv_model/tv_season_model.dart';

import '../../constants/constants.dart';
import '../../constants/core/dio.dart';
import '../../models/tv_model/tv_details_model.dart';
class TVCubit extends Cubit<TVState>{
  TVCubit(): super(InitialState());

  TVModel? onAir;
  TVModel? popularTV;
  TVModel? topRatedTV;
  TVDetailsModel? detailsTV;
  SimilarModel? similarTV;
  TVSeasonModel? seasonTV;
  TVEpisodeModel? episodeTV;
  Map? date;
  String? dropDownValue;


  void getOnAirTV(){
    try{
      Network.getOnAirTV().then((value)  => onAir = TVModel.fromJson(value.data)
     ).then((value) =>emit(GetOnAirTV()) );
    }catch(e){print(e.toString());}

  }

  void getPopularTV(){
    try{
      Network.getPopularTV().then((value)  => popularTV = TVModel.fromJson(value.data)
      ).then((value) =>emit(GetPopularTV()) ).then((value) => print(popularTV!.results![0].name.toString()+"popu") );
    }catch(e){print(e.toString());}
  }

  void getTopRatedTV(){
    try{
      Network.getTopRatedTVs().then((value)  => topRatedTV = TVModel.fromJson(value.data)
      ).then((value) =>emit(GetTopRatedTV()) );
    }catch(e){print(e.toString());}
  }

  void getDetailsTV(int? id){
    try{
      Network.getTVDetails(id).then((value)  => detailsTV = TVDetailsModel.fromJson(value.data)
        ).then((value) => dropDownValue=detailsTV!.seasons![0].name).then((value) => getSeasonTV(id:detailsTV!.id, seasonNumber: dropDownValue)).then((value) =>emit(GetDetailsTV()) );
    }catch(e){print(e.toString());}
  }

  void getSimilarTV(int? id){
    try{
      Network.getSimilarTV(id).then((value)  => similarTV = SimilarModel.fromJson(value.data)
      ).then((value) =>emit(GetSimilarTV())  );
    }catch(e){print(e.toString());}
  }

  void getSeasonTV({required int id,required seasonNumber}){
    try{
      Network.getTVSeason(tv_id: id,seasonNumber: seasonNumber).then((value)  => seasonTV = TVSeasonModel.fromJson(value.data)
      ).then((value) =>emit(GetSeasonTV()) ).then((value) => print(seasonTV!.name.toString() ));
    }catch(e){print(e.toString());}
  }

  void getEpisodTV({required  id,required seasonNumber,required episodeNumber}){
    try{
      Network.getTVEpisode(tv_id: id,seasonNumber: seasonNumber,episodNumber: episodeNumber).then((value)  => episodeTV = TVEpisodeModel.fromJson(value.data)
      ).then((value) =>emit(GetEpisondTV()) ).then((value) => print(episodeTV!.name!.toString()) );
    }catch(e){print(e.toString());}
  }

  String extractGenres(List<Genres>? genres){
    String output="";
    genres?.forEach((element) {output+=" "+element.name.toString()+".";});
    return output;
  }

  void updateDropDownValue(newValue){
    dropDownValue = newValue;
    getSeasonTV(id: detailsTV!.id, seasonNumber:dropDownValue);
    emit(UpdateDropDownValue());
  }



}
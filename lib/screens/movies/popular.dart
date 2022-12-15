import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:flutter/services.dart';
import '../../components/appbar.dart';
import '../../components/list_item.dart';
import '../../components/shared.dart';
import 'details.dart';

class PopularMoviesScreen extends StatelessWidget {
  static String PopularMoviesRoute = "PopularMoviesRoute";

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<MovieCubit>(context);
    return BlocConsumer<MovieCubit,MovieState>(
        builder:(context,state)=>Scaffold(
          backgroundColor: darkBlue,
          body: SafeArea(
            child: Column(
              children: [
                //  SizedBox(height: 40,),
                APPBar(
                  title: "Popular Movies",
                ),
                Expanded(
                  child: Container(
                    height:size.height*.93,
                    width: size.width,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          child: CreateVerticalMovueListItem(
                            data: cubit.popular,
                            index: index,
                          ),
                          onTap: () {
                            cubit.movieDetails=null;
                            ///Get details
                            cubit.getMovieDetails(cubit.popular!.movies[index].id);
                            cubit.getSimilarMovies(cubit.popular!.movies[index].id);
                            ///go to detailsScreen
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsMovieScreen()));
                           // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
                          },
                        ),
                        itemCount: cubit.popular!.movies.length,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), listener: (context,state){});
  }
}/*
///Get details
AppCubit.getMovieDetails(index);
///go to detailsScreen
Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsScreen()));
    */
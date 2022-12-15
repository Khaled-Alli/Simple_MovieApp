import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/layout/app_layout.dart';

import '../../components/appbar.dart';
import '../../components/list_item.dart';
import 'details.dart';


class TopRatedMoviesScreen extends StatelessWidget {
  static String TopRatedMoviesRoute="TopRatedMoviesRoute";
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<MovieCubit>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
          child: Column(
            children: [
              APPBar(
                title: "Top Rated Movies",
              ),
              Expanded(
                child: Container(
                  height:size.height*.93,
                  width: size.width,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) =>
                          InkWell(
                            child: CreateVerticalMovueListItem(
                        data: cubit.topRated,
                        index: index,
                      ),
                            onTap: (){
                              cubit.movieDetails=null;
                              ///Get details
                              cubit.getMovieDetails(cubit.topRated!.movies[index].id);
                              cubit.getSimilarMovies(cubit.topRated!.movies[index].id);
                              ///go to detailsScreen
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsMovieScreen()));
                            },
                          ),
                      itemCount: cubit.topRated!.movies.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,

                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
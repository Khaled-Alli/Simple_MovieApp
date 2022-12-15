import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/components/shared.dart';
import 'package:movie_app/models/movie_model/movieModel.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
import '../my_flutter_app_icons.dart';
import '../screens/movies/details.dart';
import '../screens/movies/popular.dart';
class HorizontalScrollingMoviesItems extends StatelessWidget {

bool isPopular;
String seeMoreGoTo;
HorizontalScrollingMoviesItems({required this.seeMoreGoTo,required this.isPopular });
  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
        var cubit = BlocProvider.of<MovieCubit>(context);
    return  BlocConsumer<MovieCubit,MovieState>(builder: (context,state)=>Container(
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.27,
            color: backgroundColor,
            child: Column(
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        isPopular?"Popular":"Top Rated" ,
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      InkWell(child:Row(
                        children: [
                          Text(
                            "See More",
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          Icon(
                            MyFlutterApp.angle_right,
                            color: textColor,
                          ),
                        ],
                      ),
                        onTap: (){

                          goTo(context,seeMoreGoTo);
                        },),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 150,
                  width: size.width,
                  child: ListView.separated(
                    //shrinkWrap: true,
                    itemBuilder: (context,index)=>
                        InkWell(
                          child: Container(
                      height: size.height*0.15,
                      width: size.width/3.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(

                              isPopular?
                              imageBaseUrl +
                                  cubit.popular!.movies[index].posterImage:
                              imageBaseUrl +
                                  cubit.topRated!.movies[index].posterImage,
                              fit: BoxFit.cover,
                            )),
                    ),
                          onTap: (){

                            cubit.movieDetails=null;
                            ///Get details
                            isPopular?
                            cubit.getMovieDetails(cubit.popular!.movies[index].id):
                            cubit.getMovieDetails(cubit.topRated!.movies[index].id);
                            isPopular?
                            cubit.getSimilarMovies(cubit.popular!.movies[index].id):
                            cubit.getSimilarMovies(cubit.topRated!.movies[index].id);
                            ///go to detailsScreen
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsMovieScreen()));

                          },
                        ),
                    separatorBuilder:(context,index)=> SizedBox(width: 8,),
                    itemCount: isPopular?cubit.popular!.movies.length:
                    cubit.topRated!.movies.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ), listener: (context,state){});
  }
}

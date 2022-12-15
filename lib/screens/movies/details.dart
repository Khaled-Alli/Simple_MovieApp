import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/constants/constants.dart';
import '../../components/shared.dart';
import '../../constants/colors.dart';
import '../../my_flutter_app_icons.dart';

class DetailsMovieScreen extends StatelessWidget {
  static String DetailsScreenRoute = "DetailsScreen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    var cubit = BlocProvider.of<MovieCubit>(context);
    return BlocConsumer<MovieCubit, MovieState>(builder: (context, state) =>

        Scaffold(
          backgroundColor: darkBlue,
          body: cubit.movieDetails == null ||cubit.similarMovies == null? Center(
            child: CircularProgressIndicator(
              color: textColor,

            ),)
              :
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 3,
                      child: Image.network(imageBaseUrl +
                          cubit.movieDetails!.backdropPath.toString(),
                        fit: BoxFit.fill,),
                    ),
                    Container(
                      width: size.width,
                      height: size.height / 3,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          darkBlue.withOpacity(.4),
                          darkBlue.withOpacity(.1)
                        ],
                          begin: Alignment(0, -.5),
                          end: Alignment.bottomCenter,),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.08,

                      child: IconButton(
                          onPressed: () {
                            pop(context);
                          },
                          icon: Icon(
                            MyFlutterApp.angle_left,
                            color: textColor,
                            size: 40,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cubit.movieDetails!.title.toString(),
                        style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 24),
                      ),
                      SizedBox(height: 10,),
                      Row(children: [
                        Container(
                          width: 55,
                          height: 30,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(child: Text(
                            cubit.movieDetails!.releaseDate!.substring(0, 4),
                            style: TextStyle(color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,),)),
                        ),
                        SizedBox(width: 15,),
                        Container(
                            height: 20,
                            width: 20,
                            child: Image.asset("asset/star.png",)),
                        SizedBox(width: 5,),
                        Text(cubit.movieDetails!.voteAverage.toString().substring(
                            0, 3), style: TextStyle(color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,),),
                        SizedBox(width: 15,),
                        Text((cubit.movieDetails!.runtime! / 60)
                            .floor()
                            .toString() + "h", style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,),),
                        SizedBox(width: 5,),
                        Text((cubit.movieDetails!.runtime!)
                            .remainder(60)
                            .toString() + "m", style: TextStyle(
                          color: Colors.white60,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,),),

                      ],),
                      SizedBox(height: 15,),
                      Wrap(
                        children: [
                          Text(cubit.movieDetails!.overview.toString(),
                            style: TextStyle(
                                color: Colors.white70, fontSize: 15),),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Generes: " +
                          cubit.extractGenres(cubit.movieDetails!.genres)
                              .toString(),
                        style: TextStyle(color: Colors.white60,),),
                      SizedBox(height: 30,),
                      Text("MORE LIKE THIS",
                        style: TextStyle(color: Colors.white, fontSize: 15),),
                      //SizedBox(height: 15,),
                      cubit.similarMovies == null
                          ? Container(): GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:3,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          childAspectRatio: 1/1.5,

                        ),
                        itemBuilder:(contxt,index)=>
                            Container(
                              child: Image.network(imageBaseUrl +
                                  cubit.similarMovies!.results![index].posterPath.toString(),
                                fit: BoxFit.fill,),
                            ),

                        itemCount:cubit.similarMovies!.results!.length,
                      ),
                    ],),

                ),

              ],
            ),
          ),

        ), listener: (context, state) {});
  }
}

/*
GridView.count(
      crossAxisCount:3,
     // padding: EdgeInsets.all(4.0),
      childAspectRatio: 1/1.5,
      children: cubit.similarMovies!.results![index]
          .map(
            (Item) => Container(
                              child: Image.network(imageBaseUrl +
                                  Item.posterPath.toString(),
                                fit: BoxFit.fill,),
                            ),
          )
          .toList(),
    )
*/

/*
  GridView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:3,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 7,
                          childAspectRatio: 1/1.5,

                        ),
                        itemBuilder:(contxt,index)=>
                            Container(
                              child: Image.network(imageBaseUrl +
                                  cubit.similarMovies!.results![index].posterPath.toString(),
                                fit: BoxFit.fill,),
                            ),

                        itemCount:cubit.similarMovies!.results!.length,
                      ),
* */
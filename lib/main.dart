import 'package:flutter/material.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/layout/app_layout.dart';
import 'package:movie_app/screens/movies/details.dart';
import 'package:movie_app/screens/movies/popular.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/screens/movies/top_rated.dart';
import 'package:movie_app/screens/tv/details_tv.dart';
import 'package:movie_app/screens/tv/popular_tv.dart';
import 'package:movie_app/screens/tv/top_rated_tv.dart';
import 'bloc/tv/tv_cubit.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
          create: (context) => TVCubit()
            ..getOnAirTV()
            ..getTopRatedTV()
            ..getPopularTV(),
        ),
          BlocProvider(
            create: (context) => MovieCubit()
              ..getMovies()
              ..getPopularList()
              ..getTopRatedList(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AppLayout(),
          //initialRoute: AppLayout.appLayoutRout,
          routes: {
            //   AppLayout.appLayoutRout:(context)=>AppLayout(),
            PopularMoviesScreen.PopularMoviesRoute: (context) =>
                PopularMoviesScreen(),
            TopRatedMoviesScreen.TopRatedMoviesRoute: (context) =>
                TopRatedMoviesScreen(),
            DetailsMovieScreen.DetailsScreenRoute: (context) =>
                DetailsMovieScreen(),
            PopularTVScreen.PopularTVRoute: (context) =>
                PopularTVScreen(),
            TopRatedTVScreen.TopRatedTVRoute: (context) =>
                TopRatedTVScreen(),
            DetailsTVScreen.DetailsTVScreenRoute: (context) =>
                DetailsTVScreen(),
          },
        ));
  }
}

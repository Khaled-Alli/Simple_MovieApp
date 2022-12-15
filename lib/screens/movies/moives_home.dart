import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/screens/movies/popular.dart';
import 'package:movie_app/screens/movies/top_rated.dart';
import '../../components/horizontalScrollingMoviesItems.dart';
import '../../components/the_head_poster.dart';
import '../../constants/colors.dart';
class MoivesHome extends StatelessWidget {
  const MoivesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<MovieCubit>(context);
    return BlocConsumer<MovieCubit,MovieState>(builder: (context,state)=>SafeArea(
        child:
        cubit.topRated == null
            ? Center(
          child: CircularProgressIndicator(
            color: textColor,
          ),
        ):
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              cubit.nowPlaying == null
                  ? Center(
                child: CircularProgressIndicator(
                  color: textColor,
                ),
              ):
              TheHeadPoster(moviesList: cubit.nowPlaying!.movies,isMovie: true,),
              SizedBox(height: 10),
              HorizontalScrollingMoviesItems(
                isPopular: true,
                seeMoreGoTo: PopularMoviesScreen.PopularMoviesRoute,
              ),
              SizedBox(height: 12),
              HorizontalScrollingMoviesItems(
                isPopular: false,
                seeMoreGoTo: TopRatedMoviesScreen.TopRatedMoviesRoute,
              )
            ],
          ),
        )), listener: (context,state){});
  }
}

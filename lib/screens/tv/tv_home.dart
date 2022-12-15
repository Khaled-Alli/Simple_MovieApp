import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/tv/tv_cubit.dart';
import 'package:movie_app/components/horizontalScrollingTVItems.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/screens/tv/popular_tv.dart';
import 'package:movie_app/screens/tv/top_rated_tv.dart';

import '../../bloc/movie/movie_cubit.dart';
import '../../bloc/movie/movie_state.dart';
import '../../bloc/tv/tv_state.dart';
import '../../components/horizontalScrollingMoviesItems.dart';
import '../../components/the_head_poster.dart';
import '../movies/top_rated.dart';
class TV_Home extends StatelessWidget {
  const TV_Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit =BlocProvider.of<TVCubit>(context);
    return BlocConsumer<TVCubit,TVState>(builder: (context,state)=>SafeArea(
        child:cubit.onAir == null?
        Center(child: CircularProgressIndicator(color: textColor,)):
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              cubit.onAir == null
                  ? Center(
                child: CircularProgressIndicator(
                  color: textColor,
                ),
              ):
              TheHeadPoster(moviesList: cubit.onAir!.results!,isMovie: false,),
              HorizontalScrollingTVItems(seeMoreGoTo: PopularTVScreen.PopularTVRoute, isPopular: true),
              HorizontalScrollingTVItems(seeMoreGoTo: TopRatedTVScreen.TopRatedTVRoute, isPopular: false),

            ],
          ),
        )), listener: (context,state){});
  }
}

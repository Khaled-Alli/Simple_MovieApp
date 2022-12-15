import 'package:flutter/material.dart ';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/constants/constants.dart';
import 'package:movie_app/my_flutter_app_icons.dart';
import 'package:movie_app/screens/movies/popular.dart';

import '../components/horizontalScrollingMoviesItems.dart';
import '../components/the_head_poster.dart';

class AppLayout extends StatelessWidget {

  static String appLayoutRout="appLayout";
  @override
  Widget build(BuildContext context) {

    var cubit = BlocProvider.of<MovieCubit>(context);
    var size = MediaQuery.of(context).size;
    return BlocConsumer<MovieCubit, MovieState>(
        builder: (contex, state) => cubit.topRated == null && cubit.popular==null
            ? Center(
                child: CircularProgressIndicator(
                  color: deepDarkBlue,
                ),
              )
            : Scaffold(
                backgroundColor: backgroundColor,
                body: cubit.layout[cubit.appLayoutIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: darkBlue,
                 currentIndex: cubit.appLayoutIndex,
                  onTap:(x){cubit.updateLayoutIndex(x);},
                  items: [
                    BottomNavigationBarItem(
                        icon: Material(
                          elevation: 20,
                          shadowColor: Colors.white12,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              color: deepDarkBlue,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Container(
                              width: 5,
                              height: 5,
                              //        color: Colors.red,
                              child: ClipRRect(
                                child: Image.asset(
                                  "asset/clapperboard.png",
                                  fit: BoxFit.contain,
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        label: ""),
                    BottomNavigationBarItem(
                        icon: Material(
                          elevation: 20,
                          shadowColor: Colors.white12,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                          child: Container(
                            width: 40,
                            height: 35,
                            decoration: BoxDecoration(
                              color: deepDarkBlue,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Container(
                              width: 5,
                              height: 5,
                              //        color: Colors.red,
                              child: ClipRRect(
                                child: Image.asset(
                                  "asset/monitor.png",
                                  fit: BoxFit.contain,
                                  width: 15,
                                  height: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                        label: ""),
                    // BottomNavigationBarItem(icon: icon),
                  ],
                ),
              ),
        listener: (contex, state) {});
  }
}

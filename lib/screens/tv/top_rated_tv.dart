import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/tv/tv_cubit.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:movie_app/layout/app_layout.dart';

import '../../components/appbar.dart';
import '../../components/list_item.dart';
import 'details_tv.dart';



class TopRatedTVScreen extends StatelessWidget {
  static String TopRatedTVRoute="TopRatedTVRoute";
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<TVCubit>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
          child: Column(
            children: [
              APPBar(
                title: "Top Rated TVs",
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
                            child: CreateVerticalTVListItem(
                        data: cubit.topRatedTV,
                        index: index,
                      ),
                            onTap: (){
                              cubit.detailsTV=null;
                              ///Get details
                              cubit.getDetailsTV(cubit.topRatedTV!.results![index].id);
                              cubit.getSimilarTV(cubit.topRatedTV!.results![index].id);
                              ///go to detailsScreen
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsTVScreen()));
                            },
                          ),
                      itemCount: cubit.topRatedTV!.results!.length,
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
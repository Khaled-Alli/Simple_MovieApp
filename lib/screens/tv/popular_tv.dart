 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/bloc/tv/tv_cubit.dart';
import 'package:movie_app/bloc/tv/tv_state.dart';
import 'package:movie_app/constants/colors.dart';
import 'package:flutter/services.dart';
import '../../components/appbar.dart';
import '../../components/list_item.dart';
import '../../components/shared.dart';
import 'details_tv.dart';


class PopularTVScreen extends StatelessWidget {
  static String PopularTVRoute = "PopularTVRoute";

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<TVCubit>(context);
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Column(
          children: [
            //  SizedBox(height: 40,),
            APPBar(
              title: "Popular TVs",
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
                      child: CreateVerticalTVListItem(
                        data: cubit!.popularTV,
                        index: index,
                      ),
                      onTap: () {
                        cubit.detailsTV=null;
                        ///Get details
                        cubit.getDetailsTV(cubit.popularTV!.results![index].id);
                        cubit.getSimilarTV(cubit.popularTV!.results![index].id);
                        ///go to detailsScreen

                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsTVScreen()));
                        // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
                      },
                    ),
                    itemCount: cubit.popularTV!.results!.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/tv/tv_cubit.dart';
import 'package:movie_app/bloc/tv/tv_state.dart';
import 'package:movie_app/components/shared.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
import '../my_flutter_app_icons.dart';
import '../screens/movies/details.dart';
import '../screens/tv/details_tv.dart';

class HorizontalScrollingTVItems extends StatelessWidget {

  bool isPopular;
  String seeMoreGoTo;

  HorizontalScrollingTVItems({required this.seeMoreGoTo,required this.isPopular });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<TVCubit>(context);
    return  BlocConsumer<TVCubit,TVState>(builder: (context,state)=>Container(
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
                                      cubit.popularTV!.results![index].posterPath.toString():
                                  imageBaseUrl +
                                      cubit.topRatedTV!.results![index].posterPath.toString(),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          onTap: (){

                            cubit.detailsTV=null;
                            // /Get details
                            isPopular?
                            cubit.getDetailsTV( cubit.popularTV!.results![index].id):
                            cubit.getDetailsTV(cubit.topRatedTV!.results![index].id);
                            isPopular?
                            cubit.getSimilarTV(cubit.popularTV!.results![index].id):
                            cubit.getSimilarTV(cubit.topRatedTV!.results![index].id);

                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsTVScreen()));

                          },
                        ),
                    separatorBuilder:(context,index)=> SizedBox(width: 8,),
                    itemCount: isPopular?cubit.popularTV!.results!.length:
                    cubit.topRatedTV!.results!.length,
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

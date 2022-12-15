import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie/movie_cubit.dart';
import 'package:movie_app/bloc/movie/movie_state.dart';
import 'package:movie_app/bloc/tv/tv_cubit.dart';
import 'package:movie_app/bloc/tv/tv_state.dart';
import 'package:movie_app/components/list_item.dart';
import 'package:movie_app/constants/constants.dart';
import '../../components/shared.dart';
import '../../constants/colors.dart';
import '../../my_flutter_app_icons.dart';

class DetailsTVScreen extends StatelessWidget {
  static String DetailsTVScreenRoute = "DetailsTVScreen";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<TVCubit>(context);
    return BlocConsumer<TVCubit, TVState>(
        builder: (context, state) => Scaffold(
              backgroundColor: darkBlue,
              body: cubit.detailsTV == null && cubit.seasonTV== null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: textColor,
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child:cubit.detailsTV == null
                          ?Container(): Column(
                        children: [

                          Stack(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height / 3,
                                child: cubit.detailsTV!.backdropPath == ""
                                    ? Image.asset(
                                        "asset/ImagNF.jpg",
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        imageBaseUrl +
                                            cubit.detailsTV!.backdropPath
                                                .toString(),
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              Container(
                                width: size.width,
                                height: size.height / 3,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      darkBlue.withOpacity(.4),
                                      darkBlue.withOpacity(.1)
                                    ],
                                    begin: Alignment(0, -.5),
                                    end: Alignment.bottomCenter,
                                  ),
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
                                  cubit.detailsTV!.name.toString(),
                                  style: TextStyle(
                                      color: textColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 55,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: backgroundColor,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Center(
                                          child: Text(
                                        cubit.detailsTV!.firstAirDate!
                                            .substring(0, 4),
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                        height: 20,
                                        width: 20,
                                        child: Image.asset(
                                          "asset/star.png",
                                        )),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      cubit.detailsTV!.voteAverage
                                          .toString()
                                          .substring(0, 3),
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      cubit.detailsTV!.numberOfSeasons
                                              .toString() +
                                          " Seasons",
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Wrap(
                                  children: [
                                    Text(
                                      cubit.detailsTV!.overview.toString(),
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 15),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Generes: " +
                                      cubit
                                          .extractGenres(
                                              cubit.detailsTV!.genres)
                                          .toString(),
                                  style: TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                //SizedBox(height: 15,),

                                DefaultTabController(
                                    length: 2,
                                    child: Column(
                                      children: [
                                        Container(
                                          child: TabBar(
                                            physics: BouncingScrollPhysics(),
                                            unselectedLabelColor:
                                                Colors.white70,
                                            // indicator: BoxDecoration(),
                                            indicatorColor: releaceDateColor,
                                            // indicatorSize: TabBarIndicatorSize.tab,
                                            indicatorWeight: 4,
                                            //indicatorPadding: EdgeInsets.fromLTRB( 0,0,0,20),
                                            labelPadding: EdgeInsets.symmetric(
                                                vertical: 15),

                                            tabs: [
                                              Text(
                                                "EPISODES",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                              Text(
                                                "MORE LIKE THIS",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: darkBlue,
                                          height: 500,
                                          width: size.width,

                                          child: TabBarView(children: [
                                            Container(
                                              height: 500,
                                              child: Column(
                                                 children: [
                                                   SizedBox(height: 15,),
                                                  Container(
                                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                                    child: DropdownButton(
                                                      style: TextStyle(
                                                          color: Colors.white60,
                                                          fontSize: 18),
                                                      underline: SizedBox(),
                                                      isExpanded: true,
                                                      value:cubit.dropDownValue,
                                                      dropdownColor: backgroundColor,
                                                        iconSize: 26,
                                                      icon: Icon(Icons.arrow_drop_down_outlined,size: 25,color: Colors.white60,),
                                                      alignment: Alignment.topCenter,
                                                      menuMaxHeight: 200,
                                                      items: cubit.detailsTV!.seasons!
                                                          .map((e) => DropdownMenuItem(
                                                              child:  Text(
                                                                e.name.toString(),
                                                                style: TextStyle(
                                                                    color: Colors.white60,
                                                                    fontSize: 18,fontWeight: FontWeight.w400),
                                                              ),value:e.name ,))
                                                          .toList(),
                                                      onChanged:(newValue){ cubit.updateDropDownValue(newValue);},
                                                      borderRadius:
                                                          BorderRadius.circular(15),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: backgroundColor,
                                                      borderRadius: BorderRadius.circular(5),
                                                    ),
                                                    width: size.width,
                                                    height: 50,
                                                  ),
                                                   SizedBox(height: 10,),
                                                   Column(
                                                     children: [
                                                       Container(
                                                         height:size.height*.5,
                                                         width: size.width,
                                                         child: SingleChildScrollView(
                                                           scrollDirection: Axis.vertical,

                                                           physics: BouncingScrollPhysics(),
                                                           child:   cubit.seasonTV == null || cubit.seasonTV!.episodes.isEmpty
                                                               ? Container():ListView.builder(
                                                             shrinkWrap: true,
                                                             itemBuilder: (context, index) =>

                                                                 CreateVerticalDetailsTVListItem(
                                                               data: cubit.seasonTV,
                                                               index: index,
                                                             ),

                                                             itemCount: cubit.seasonTV!.episodes.length,
                                                             physics: BouncingScrollPhysics(),
                                                             scrollDirection: Axis.vertical,

                                                           ),
                                                         ),
                                                       ),
                                                     ],
                                                   ),
                                                ],
                                              ),
                                            ),
                                            GridView.builder(
                                              scrollDirection: Axis.vertical,
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                                crossAxisSpacing: 8,
                                                mainAxisSpacing: 8,
                                                childAspectRatio: 1 / 1.5,
                                              ),
                                              itemBuilder: (contxt, index) {
                                                return Container(
                                                  child: Image.network(
                                                    imageBaseUrl +
                                                        cubit
                                                            .similarTV!
                                                            .results![index]
                                                            .posterPath
                                                            .toString(),
                                                    fit: BoxFit.fill,
                                                  ),
                                                );
                                              },
                                              itemCount: cubit
                                                  .similarTV!.results!.length,
                                            ),
                                          ]),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
        listener: (context, state) {});
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

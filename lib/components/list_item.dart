import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model/movieModel.dart';
import 'package:movie_app/models/tv_model/tv_details_model.dart';
import 'package:movie_app/models/tv_model/tv_model.dart';
import 'package:movie_app/models/tv_model/tv_season_model.dart';

import '../constants/colors.dart';
import '../constants/constants.dart';
class CreateVerticalMovueListItem extends StatelessWidget {
  MovieModel? data;
  int index;
  CreateVerticalMovueListItem({required this.data,required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.21 ,
      width: size.width,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: size.width*0.255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(

                  imageBaseUrl + data!.movies[index].posterImage,fit: BoxFit.fill,

                )),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Container( width: 240,
                  child: Text(data!.movies[index].name,style: TextStyle(color: textColor,fontSize: 16,fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,)),
              SizedBox(height: 8,),
              Row(children: [
                Container(
                  width: 45,
                  height: 20,
                  decoration: BoxDecoration(
                    color: releaceDateColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:Center(child: Text(data!.movies[index].releaseDate.substring(0,4),style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w400,),)),
                ),
                SizedBox(width: 15,),
                Container(
                    height: 18,
                    width: 18,
                    child: Image.asset("asset/star.png",)),
                SizedBox(width: 5,),
                Text(data!.movies[index].rate.toString(),style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w400,),),


              ],),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 230,
                child: Text(data!.movies[index].overview,style: TextStyle(color: textColor,fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class CreateVerticalTVListItem extends StatelessWidget {
  TVModel? data;
  int index;
  CreateVerticalTVListItem({required this.data,required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.21 ,
      width: size.width,
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: size.width*0.255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(

                  imageBaseUrl + data!.results![index].posterPath.toString(),fit: BoxFit.fill,

                )),
          ),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16,),
              Container( width: 240,
                  child: Text(data!.results![index].name.toString(),style: TextStyle(color: textColor,fontSize: 16,fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,)),
              SizedBox(height: 8,),
              Row(children: [
                Container(
                  width: 45,
                  height: 20,
                  decoration: BoxDecoration(
                    color: releaceDateColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child:Center(child: Text(data!.results![index].firstAirDate!.substring(0,4),style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w400,),)),
                ),
                SizedBox(width: 15,),
                Container(
                    height: 18,
                    width: 18,
                    child: Image.asset("asset/star.png",)),
                SizedBox(width: 5,),
                Text(data!.results![index].voteAverage.toString(),style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w400,),),


              ],),
              SizedBox(height: 25,),
              Container(
                height: 50,
                width: 230,
                child: Text(data!.results![index].overview.toString(),style: TextStyle(color: textColor,fontSize: 12,),overflow: TextOverflow.ellipsis,maxLines: 2,),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
class CreateVerticalDetailsTVListItem extends StatelessWidget {
  TVSeasonModel? data;
  int index;
  CreateVerticalDetailsTVListItem({required this.data,required this.index});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
          children: [
            Container(
              width: size.width*0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child:
                  data!.episodes![index].stillPath == null ?
                   Image.asset("asset/ImagNF.jpg",fit: BoxFit.fill)
                      :
                  Image.network(

                    imageBaseUrl + data!.episodes![index].stillPath.toString(),fit: BoxFit.fill,

                  )
              ),
            ),
            SizedBox(width: 10,),
            Container(
              width: 210,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [

                      Text(data!.episodes![index].name.toString(),style: TextStyle(color: textColor,fontSize: 14,fontWeight: FontWeight.w500,),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ],
                  ),
                  if(data!.episodes![index].airDate !=null)
                  Text(data!.episodes![index].airDate!,style: TextStyle(color: Colors.white60,fontSize: 14,fontWeight: FontWeight.w400,),),
                ],
              ),
            ),

          ],
        ),
          SizedBox(height: 15,),
         Wrap(
           children: [
             Text(data!.episodes![index].overview.toString(),style: TextStyle(color: Colors.white60,fontSize: 14,),overflow: TextOverflow.ellipsis,maxLines: 10,),
           ],
         ),



        ],
      ),
    );
  }
}
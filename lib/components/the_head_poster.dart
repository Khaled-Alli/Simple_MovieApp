import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constants/colors.dart';
import '../constants/constants.dart';
class TheHeadPoster extends StatelessWidget {
  List moviesList;
  bool isMovie;
  TheHeadPoster({required this.moviesList,required this.isMovie});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child:
        CarouselSlider(
          items: moviesList.map((e) =>
              Container(
                height: size.height * 0.45,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.45,
                      width: size.width,
                      child: e.backdropPath==null?
                      Image.asset(
                        "asset/ImagNF.jpg",
                        fit: BoxFit.cover,
                      ) :
                      Image.network(
                        imageBaseUrl + e.backdropPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: size.height * 0.45,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [
                                backgroundColor.withOpacity(1),
                                backgroundColor.withOpacity(0),
                              ])),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.45 - 90,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                  color: releaceDateColor,
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              isMovie?
                              "NOW PLAYING":"ON THE AIR",
                              style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Text(
                          e.name,textAlign:TextAlign.center,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 22),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ).toList(),
          options: CarouselOptions(
            height: size.height * 0.4499,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 6),
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(seconds: 6),
            autoPlayCurve: Curves.fastLinearToSlowEaseIn,
            viewportFraction: 1,
          ),),
    );
  }
}



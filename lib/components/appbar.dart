import 'package:flutter/material.dart';
import 'package:movie_app/components/shared.dart';

import '../constants/colors.dart';
import '../my_flutter_app_icons.dart';
class APPBar extends StatelessWidget {
 String title;
 APPBar({required this.title});
  @override
  Widget build(BuildContext context) {
    var size =MediaQuery.of(context).size;
    return  SafeArea(
      child: Container(
        height: size.height * 0.07,
        width: size.width,
        color: appBarColor,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    title ,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      pop(context);
                    },
                    icon: Icon(
                      MyFlutterApp.angle_left,
                      color: textColor,
                      size: 30,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

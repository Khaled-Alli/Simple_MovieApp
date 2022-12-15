import 'package:flutter/material.dart';
void goTo(context,string){ Navigator.pushNamed(context, string);}

void pop(context){ Navigator.pop(context);}

Map handlingDate(int? runTime){
  Map date={"h":"","m":"",};
  if(runTime!>=60)
  {
    date["h"]=(runTime/60).floor().toString();
    date["m"]=(runTime.remainder(60)).toString();
  }else{
    date["m"]=(runTime.remainder(60)).toString();
  }
  return date;
}

String? handleSeasonNumber(String season){
  if(season =="Season 1")
    return "1";
  else if(season =="Season 2")
    return "2";
  else if(season =="Season 2")
    return "3";
  else if(season =="Season 2")
    return "4";
  else if(season =="Season 2")
    return "5";
  else if(season =="Season 2")
    return "6";
  else if(season =="Season 2")
    return "7";
  else if(season =="Season 2")
    return "8";
  else if(season =="Season 2")
    return "9";
  else if(season =="Season 2")
    return "10";
  else if(season =="Season 2")
    return "11";
  else
    return "0";
}
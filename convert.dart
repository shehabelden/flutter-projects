import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget getWeatherIcon({String WeatherDescripition,Color color,double size}){
  switch(WeatherDescripition){
    case "Clear":
      {
        color=Colors.orangeAccent[200];
        return Icon(FontAwesomeIcons.sun,color:color,size: size,);
      }
      break;
    case "Clouds":
      {
        color=Colors.grey[200];
        return Icon(FontAwesomeIcons.cloud,color:color,size: size,);
      }
      break;
    case "Snow":
      {
        color=Colors.lightBlueAccent[200];
        return Icon(FontAwesomeIcons.snowman,color:color ,size: size,);
      }
      break;
    default:{
      return Icon(FontAwesomeIcons.sun,color:color,size: size,);
    }
  }
}
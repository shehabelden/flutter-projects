import 'package:flutter/material.dart';
import 'package:flutter_app/Util.dart';

import 'WeatherForecastModel.dart';
Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot,int index){
 var dayOfweek="";
 var fulldate=Util.getFormatedate(
  new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt *1000)
 );
 dayOfweek=fulldate.split(",")[0];
return Column(
 mainAxisAlignment:MainAxisAlignment.start ,
 crossAxisAlignment:CrossAxisAlignment.start,
 children: <Widget>[
      Text(dayOfweek),
 ],
);
}


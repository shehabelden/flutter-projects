import 'package:flutter/material.dart';
import 'package:flutter_app/Util.dart';
import 'package:flutter_app/convert.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'WeatherForecastModel.dart';
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){
var forecastlist= snapshot.data.main;
Container midView=Container(
  child:Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
      children: <Widget>[
        Text(" ${snapshot.data.name} , ${snapshot.data.sys.country} ",style: TextStyle(
          fontWeight:FontWeight.bold,
          fontSize:18 ,
        ),),
        Text("${Util.getFormatedate(new DateTime.fromMillisecondsSinceEpoch(snapshot.data.dt *1000))}"),
      SizedBox(height: 20,),
         getWeatherIcon(WeatherDescripition:snapshot.data.weather[0].main,color:Colors.pinkAccent  ,size: 190),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Text("${forecastlist.temp} F",style:TextStyle(
               fontSize:34 , 
              ),),
              Text(" ${snapshot.data.weather[0].main} "),
              Text(" ${snapshot.data.weather[0].description.toUpperCase()}"),
      ],
    ),
  ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical:11.0 ,horizontal: 12.0 ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center ,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center ,
                  children: <Widget>[
                    Text("${snapshot.data.wind.speed} mi/h"),
                   Icon(FontAwesomeIcons.temperatureHigh,size:20,),
                    // Icon(Icons.arrow_forward,size:20 ,color:Colors.brown),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    children:<Widget>[
                      Text("${forecastlist.humidity} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat,size:20 ,color:Colors.brown),
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children:<Widget>[
                        Text("${forecastlist.tempMax} F"),
                        Icon(FontAwesomeIcons.temperatureHigh,size:20 ,color:Colors.brown),

                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);
return midView;
}
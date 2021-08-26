import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/WeatherForecastModel.dart';
import 'package:flutter_app/card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget bottomView(AsyncSnapshot<WeatherForecastModel>snapshot,BuildContext context){
  var forecast=snapshot.data.main;
  return Column(
    mainAxisAlignment:MainAxisAlignment.start ,
    children: <Widget>[
   Text("7day",style:TextStyle(
     fontSize:14 ,

   ) ,),
    Container(
      height: 170,
    child:Padding(
      padding: const EdgeInsets.symmetric(vertical:16 , horizontal: 10 ),
      child: ListView.separated(
        scrollDirection:Axis.horizontal ,
          separatorBuilder: (context,index )=>SizedBox(width: 8,) ,
          itemCount: snapshot.data.weather.length,
           itemBuilder: (context,index )=>ClipRRect(
             borderRadius:BorderRadius.all(Radius.circular(10)) ,
             child: Container(
               width:MediaQuery.of(context).size.width ,
               height:150 ,
               child:forecastCard(snapshot,index) ,
               decoration:BoxDecoration(
                 gradient:LinearGradient(colors:[Colors.lightBlueAccent, Colors.white],
                 begin: Alignment.topLeft,end: Alignment.bottomRight ,
                 ),

               ),
             ),
           ),
      ),
    ) ,
    ),
      ],
 );
}
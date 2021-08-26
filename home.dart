import 'dart:developer';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bottom.dart';
import 'package:flutter_app/movelist.dart';
import 'package:flutter_app/quslist.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'MidView.dart';
import 'WeatherForecastModel.dart';
import 'network.dart';
class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  Future<WeatherForecastModel>forcastObject;
  String _cityName="Cairo";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    forcastObject = getweatherForecast();
    forcastObject.then((weather)  {
       print("City is ${weather.weather}");
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          textFieldView(),
          Container(
            child: FutureBuilder<WeatherForecastModel>(
              future: forcastObject ,
              builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot ){
             if(snapshot.hasData){
               return Column(
               children: <Widget>[
                 midView(snapshot),
                 bottomView(snapshot, context)
               ],
               );
             }else{
               return Container(
               child:Center(child:CircularProgressIndicator(),) ,

               );

             }
              },
            ),
          ),
        ],

      ),
    );
  }

 Widget textFieldView() {
    return Container(
      child: TextField(
      decoration: InputDecoration(

        hintText: "Enter City Name" ,
        prefixIcon: Icon(Icons.search) ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10) ,
        ),
        contentPadding:EdgeInsets.all(10),
      ) ,
        onSubmitted:(value){
            setState(() {
              _cityName=value;
              forcastObject =getweatherForecast();
                         });
        },
      ),
    );
 }
 Future<WeatherForecastModel> getweatherForecast({String cityname}) =>
     new Network().getWeatherForecast(cityName: _cityName);
}
class ShowSimpleMapState extends StatefulWidget {
  @override
 _ShowSimpleMapStateState createState() => _ShowSimpleMapStateState();
}
class _ShowSimpleMapStateState extends State<ShowSimpleMapState> {
 GoogleMapController mapController;
 final LatLng _cinter = const LatLng(45,12);
 void _onMapCreated(GoogleMapController controller){
   mapController =controller ;
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("map"),
      ),
      body: GoogleMap(
       onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _cinter,zoom: 12.0) ,
      ),
    );
  }
}



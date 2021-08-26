import 'dart:developer';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/movelist.dart';
import 'package:flutter_app/quslist.dart';
class Movie extends StatelessWidget {
  final List<Moviel>movelist=  Moviel.getMovies();
  final List mn=[
    "Avatar",
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Movie"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor:Colors.blueGrey.shade900,
      // backgroundColor: Colors.blueGrey[400],
      body: ListView.builder(
          itemCount: movelist.length,
          itemBuilder: (BuildContext context,int ind ){
            return Stack(
                children:<Widget>[
                  moveCard(movelist[ind], context),
                  Positioned(
                      top:10,
                      child: Images(movelist[ind].Images[0])
                  ),
                ]
            );
            //     return Card(
            //    elevation: 4.5,
            //   color: Colors.grey[200],
            //   child: ListTile(
            //     leading:CircleAvatar(
            //       child: Container(
            //         width: 200,
            //         height: 200,
            //         decoration: BoxDecoration(
            //         color:Colors.grey[300],
            //         borderRadius: BorderRadius.circular(13.9),
            //           image:DecorationImage(
            //             image:NetworkImage(movelist[ind].Images[0]),
            //           ),
            //         ),
            //       ),
            //     ),
            //     title: Text(mn[ind]),
            //     subtitle: Text("goin"),
            //     //onTap:()=> debugPrint("Movie name: ${mn.elementAt(ind)}"),
            //   ),
            // );
          }
      ),
    );
  }
  Widget moveCard(Moviel move ,BuildContext context){
    return InkWell(
      child: Container(
        width:MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.blueGrey.shade800,
          child: Padding(
            padding: const EdgeInsets.only(top:15,
              left:105 ,
              bottom:45 ,
            ),
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start ,
              mainAxisAlignment:MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children:<Widget>[
                      Text(move.Title,
                        style: TextStyle(
                          fontWeight:FontWeight.bold ,
                          fontSize:20,
                          color:Colors.white60,
                        ),
                      ),
                      Text("Radting: ${move.Rated} /10",
                        style:TextStyle(
                          fontSize:14,
                          color:Colors.white30,
                        ) ,
                      )
                    ]
                )
              ],
            ),
          ),
        ),
      ),
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>
                themove(movname: move.Title,
                  move:move ,
                )));
      },

    );
  }
}
Widget Images(String imagurl){
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      shape:BoxShape.circle,
      image:DecorationImage(image:NetworkImage(imagurl ?? "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg",

      ),
        fit:BoxFit.cover,
      ) ,
    ),
  );
}
class themove extends StatelessWidget {
  final String movname;
  final Moviel move;
  const themove({Key key,this.move ,this.movname}) : super(key: key);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text(this.movname),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          Moviethum(thum:move.Images[1],),
          Moveposter(movie:move,),
          horize(),
          Moviecast(movie: move,),
          horize(),
          MoveEtraImage(
            imge:move.Images,
          ),
        ],

      ),
      // body: Container(
      //   child: RaisedButton(
      //     child: Text("back ${this.move.Title}"),
      //     onPressed: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
    );
  }
}
class Moviethum extends StatelessWidget {
  final String thum;
  const Moviethum({Key key, this.thum}) : super(key: key);
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment:Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image:NetworkImage(thum),
                  fit:BoxFit.cover,
                ),
              ),
            ),
            Icon(Icons.play_circle_outline,
              color:Colors.white.withOpacity(0.3),
              size:75 ,
            ),
          ],
        ),
        Container(
          decoration:BoxDecoration(
            gradient:LinearGradient(
              colors:[
                Colors.white.withOpacity(0.0),
                Colors.white,
              ],
              begin:Alignment.topCenter ,
              end: Alignment.bottomCenter,
            ),
          ),
          height:80,
        ),
      ],
    );
  }
}
class Movehedar extends StatelessWidget {
  final Moviel movie;
  const Movehedar({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom:10.0),
          child: Text("${movie.Title}".toUpperCase(),
            style:TextStyle(
              fontSize: 20,
              fontWeight:FontWeight.bold ,

            ) ,
          ),
        ),
        Text("${movie.Year} . ${movie.Genre}".toUpperCase(),
          style:TextStyle(
            fontSize: 17,
            fontWeight:FontWeight.w400,
            color:Colors.lightBlueAccent[100] ,
          ) ,
        ),
        Text.rich(TextSpan(style:TextStyle (
          fontSize:15,
          fontWeight:FontWeight.w300  ,

        ),
            children: <TextSpan>[
              TextSpan(
                text:movie.Plot,
              )
            ]
        ),
        ),
      ],
    );
  }
}
class Moveposter extends StatelessWidget {
  final Moviel movie;
  const Moveposter({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16),
      child: Row(
        children: <Widget>[
          Movieposter(poster:movie.Images[2].toString()),
          SizedBox(width: 17,),
          Expanded(
            child:Movehedar(movie: movie),
          ),
        ],
      ),
    );
  }
}
class Movieposter extends StatelessWidget {
  final String poster;
  const Movieposter({Key key, this.poster}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var borderRadius=BorderRadius.all(Radius.circular(10));
    return Card(
      child:ClipRRect(
        borderRadius: borderRadius,
        child:Container(
          width: MediaQuery.of(context).size.width/4,
          height: 160,
          decoration: BoxDecoration(
            image: DecorationImage(image:NetworkImage(poster),
              fit:BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
class Moviecast extends StatelessWidget {
  final Moviel movie;
  const Moviecast({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal:12),
      child:Column(
        children: <Widget>[
          Moviefilde(filed:"cast",value:movie.Actors),
          Moviefilde(filed:"dirctor",value:movie.Director),
          Moviefilde(filed:"Award",value:movie.Awards)
        ],
      ) ,
    );
  }
}
class Moviefilde extends StatelessWidget {
  final String filed;
  final String value;
  const Moviefilde({Key key, this.filed, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: <Widget> [
        Text("$filed: ",style:TextStyle(
          fontSize:15,
          fontWeight:FontWeight.bold  ,
       ) ,),
        Text(value,style:TextStyle(
          fontSize:15,
          fontWeight:FontWeight.w300  ,
        ))
      ],
    );
  }
}
class horize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:12,vertical: 12  ),
      child: Container(
        height:0.7,
        color:Colors.grey[350] ,
      ),
    );
  }
}
class MoveEtraImage extends StatelessWidget {
  final List<String> imge;
  const MoveEtraImage({Key key, this.imge}) : super(key: key);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: <Widget>[
        Text("more image".toUpperCase(),
          style:TextStyle(
            fontSize:14,
            color:Colors.black26,
          ) ,),
        Container(
          height: 200,
          child:ListView.separated(
            scrollDirection:Axis.horizontal ,
            separatorBuilder:(context,index)=>SizedBox(width: 8,),
            itemCount:imge.length ,
            itemBuilder:(context,index)=>ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child:Container(
                width:MediaQuery.of(context).size.width / 4,
                height: 160,
                decoration:BoxDecoration(
                  image:DecorationImage(image:NetworkImage(imge[index]),
                    fit:BoxFit.cover,
                  ) ,
                ) ,
              ) ,
            ) ,
          ),
        ),
      ],
    );
  }
}

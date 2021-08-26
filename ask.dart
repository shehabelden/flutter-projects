import 'package:flutter/material.dart';
import 'dart:developer';
// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/quslist.dart';

class quiz extends StatefulWidget{
  @override
  _quizState createState() => _quizState();
}
class _quizState extends State<quiz>{
  int con=0;
  List Q=[
    Qs.name(" من واحد القطرين ",true),
    Qs.name(" من اول من اخترع فوانيس رمضان ",false),
    Qs.name(" من اول شخص حكم مصر الحديثه ",true),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ask"),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.white60,
      body: Builder(
        builder:(BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("img/flag.png"
                  ,width: 250,
                  height: 250,),
              ),
              Container(
                height: 120,
                child: Text(Q[con % Q.length].s,style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed:()=>checkAnswer(true,context),
                    color: Colors.white60,
                    child: Text("yes"),
                  ),
                  RaisedButton(onPressed:()=>checkAnswer(false,context),
                    color: Colors.white60,
                    child: Text("no"),
                  ),
                  RaisedButton(onPressed:()=>_nextquestion(),
                    color: Colors.white60,
                    child:Icon(Icons.arrow_forward) ,
                  ),

                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(bool a,BuildContext context ) {
    if (a==Q[con].b){
      debugPrint("Correct");
      final snackbar=SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 300),
          content:Text("true")
      ) ;
      Scaffold.of(context).showSnackBar(snackbar);
    }else{
      debugPrint("rong");
      final snackbar=SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 300),
          content:Text("false")
      ) ;
      Scaffold.of(context).showSnackBar(snackbar);
    }
  }
  _nextquestion() {
    setState(() {
      con=(con+1) % Q.length;
    });
  }

}


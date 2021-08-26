import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(" بسم الله الرحمن الرحيم "),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            _getCard()
          ],
        ),
      ),
    );
  }
  Container _getCard() {
    return Container(
        width: 200 ,
        height: 200 ,
        decoration: BoxDecoration(
          color:Colors.deepOrange,
          borderRadius: BorderRadius.circular(4.5),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: <Widget>[
              Text("الله اكبر "),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Icon(Icons.person_outline),
                    Text("remabmer the god")
                  ]
              )
            ]
        )
    );
  }
}
class Azkar extends StatefulWidget{
  @override
  State createState() => _Alzkr();
}
class _Alzkr extends State<Azkar> {
  int _index=0;
  int count=0;
  Widget build(BuildContext context) {
    List quotes = [
      "سبحاً الله",
      "الله كبر",
      "استغفر الله",
      "لا اله الا الله ",
      "اشهد ان لا الله الي الله وان محمداً رسول الله"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(" الاذكار "),

        backgroundColor:Colors.orange,

      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child:Center(child:Text(quotes[_index % quotes.length])),
              width: 250,
              height: 65,
              decoration:BoxDecoration(
                color:Colors.orangeAccent ,
              ) ,
            ),
            FlatButton.icon(
              onPressed:_ShowQout,
              icon: Icon(Icons.wb_sunny),
              label: Text("presse for anthare zkr"),
            ),

            FlatButton.icon(
              onPressed:Add_alazkar,
              icon: Icon(Icons.alarm_add),
              label: Text("counter"),
            ),
          ],
        ),
      ),

    );
  }
  void _ShowQout(){
    setState((){
      _index +=1;
    });
  }

  void Add_alazkar() {
    setState(() {
      count+=1;
      return count;
    });
    // Text(count);
  }
}
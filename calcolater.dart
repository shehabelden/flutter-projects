import 'dart:developer';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class calcoulater extends StatefulWidget {
  @override
  _calcoulaterState createState() => _calcoulaterState();
}

class _calcoulaterState extends State<calcoulater> {
  double _billAmount=0.0;
  int cont=0;
  int p=0;

  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.center ,
        color:Colors.white60 ,
        child: ListView(
          scrollDirection: Axis.vertical ,
          padding: EdgeInsets.all(20),
          children: <Widget>[
            Container(
              width:150,
              height:200,
              margin:EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.15),
              decoration: BoxDecoration(
                color:Colors.purple.shade600.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20) ,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                    Text("your many"),
                    Text("111"),
                  ],
                ) ,
              ) ,
            ),
            Container(
              padding: EdgeInsets.all(20),
              margin:EdgeInsets.all(10) ,
              decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(20) ,
                  border:Border.all(
                    color:Colors.purple.shade600.withOpacity(0.1),
                    style:BorderStyle.solid,
                  )
              )
              ,
              child: Column(
                children: <Widget>[
                  TextField(
                    style: TextStyle(color: Colors.grey) ,
                    decoration: InputDecoration(
                      prefixText:"you cash ",

                    ),

                    onChanged: (String value){
                      try{
                        _billAmount = double.parse(value);
                      }catch(exception){

                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget> [
                      Text("split",style: TextStyle(
                        color: Colors.grey.shade600 ,

                      ),),
                      Row(
                        children: <Widget> [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(cont>1){
                                  cont--;
                                }
                              });
                            },
                            child:Container(
                              width:40,
                              height: 40,
                              margin:EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:Colors.purple.shade600.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:Center(
                                child:Text("-",style: TextStyle(
                                  color:Colors.purple,
                                  fontSize:20 ,
                                  fontWeight: FontWeight.bold,
                                ),
                                ) ,
                              ),
                            ),
                          ),
                          Text("$cont",style:TextStyle(
                            color:Colors.purple.shade600,
                            fontSize:20 ,
                            fontWeight: FontWeight.bold,
                          )
                          ),
                          InkWell(
                            onTap:(){
                              setState(() {
                                cont++;
                              });
                            },
                            child: Container(
                              width:40,
                              height: 40,
                              margin:EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color:Colors.purple.shade600.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child:Center(
                                child:Text("+",style: TextStyle(
                                  color:Colors.purple,
                                  fontSize:20 ,
                                  fontWeight: FontWeight.bold,
                                ),
                                ) ,
                              ),

                            ),

                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children:<Widget> [
                      Text("Tip",style: TextStyle(
                        color:Colors.grey.shade700,

                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(" \$ ${Thechashmath(_billAmount, cont, p)}",style:TextStyle(
                          color: Colors.purple.shade600,
                          fontWeight: FontWeight.bold ,
                          fontSize: 17,
                        ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children:<Widget>[
                      Text("$p%",style: TextStyle(
                        color:Colors.purple.shade600 ,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                      Slider(
                        min: 0,
                        max: 100,
                        activeColor: Colors.purple.shade600,
                        inactiveColor:Colors.grey ,
                        value: p.toDouble(),
                        onChanged: (double newvalue)
                        {
                          setState(() {
                            p= newvalue.round();
                          });
                        },),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ) ,
      ) ,
    );

  }
  thechash(double _billAmount,int count,double a  ){
    var t = (_billAmount+p)/cont ;
  }
  Thechashmath(double _billAmount,int cont,int p ){
    double a = 0.0 ;
    if(_billAmount <0 || _billAmount.toString().isEmpty || _billAmount ==null ){
      //no go !

    }else{
      a=(_billAmount+p)/100;
      return a;
    }
  }
}

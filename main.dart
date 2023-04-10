import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch:Colors.deepOrange,),
      title: 'Material App',
      home: Scaffold(backgroundColor: Colors.blue.shade300,
        appBar: AppBar(
          title: Text('hesap makinesi'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment:CrossAxisAlignment.stretch,
          children: [
          Text(history, textAlign:TextAlign.end,style: TextStyle(fontSize: 40,color: Colors.grey.shade600),),
          SizedBox(height: 10,),
          Text(texttodis, textAlign:TextAlign.end,style: TextStyle(fontSize: 40)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              buttonlar("AC", Colors.deepOrange,30),
              buttonlar("C",Colors.deepOrange,30),
              buttonlar("BACK",Colors.yellow,20),
              buttonlar("/",Colors.yellow,30),
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              buttonlar("7", Colors.deepOrange,30,),
              buttonlar("8",Colors.deepOrange,30),
              buttonlar("9",Colors.deepOrange,30),
              buttonlar("X",Colors.yellow,30),
            ],),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonlar("4", Colors.deepOrange,30),
                buttonlar("5",Colors.deepOrange,30),
                buttonlar("6",Colors.deepOrange,30),
                buttonlar("-",Colors.yellow,50),
              ],),Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonlar("1", Colors.deepOrange,30),
                buttonlar("2",Colors.deepOrange,30),
                buttonlar("3",Colors.deepOrange,30),
                buttonlar("+",Colors.yellow,30),
              ],),Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttonlar("0", Colors.deepOrange,30),
                buttonlar("00",Colors.deepOrange,30),
                buttonlar("000",Colors.deepOrange,30),
                buttonlar("=",Colors.yellow,30),
              ],),
        ],)
      ),
    );
  }

  Widget buttonlar(var deger, Color renk, double yaziboyutu) {
    return InkWell(
      onTap: (){
        buttonpres(deger);
      },
      child: Container(
        margin: EdgeInsets.all(4),
        height: 70,
        width: 80,
        child: Center(child: Text(deger.toString(), style: TextStyle(fontSize: yaziboyutu))),
        decoration: BoxDecoration(color:renk,
          border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
  int sayi1=0;
  int sayi2=0;
  String history="";
  String texttodis="";
  String res="";
  String operation="";
  buttonpres(deger){
    if(deger=="C"){
      texttodis="";
      res="";
      sayi2=0;
      sayi1=0;
    } else if (deger == "BACK") {
      res = texttodis.substring(0, texttodis.length - 1);
    }
    else if(deger=="AC"){
      texttodis="";
      res="";
      sayi2=0;
      sayi1=0;
      history="";
    }else if(deger=="+" || deger=="-" || deger=="X" ||deger=="/"){
      sayi1=int.parse(texttodis);
      res="";
      operation=deger;
    }else if(deger=="="){
      sayi2=int.parse(texttodis);
      if(operation=="+"){
        res=(sayi1+sayi2).toString();
        history=sayi1.toString()+operation.toString()+sayi2.toString();
      }else if(operation=="-"){
        res=(sayi1-sayi2).toString();
        history=sayi1.toString()+operation.toString()+sayi2.toString();
      }else if(operation=="X"){
        res=(sayi1*sayi2).toString();
        history=sayi1.toString()+operation.toString()+sayi2.toString();
      }else if(operation=="/"){
        res=(sayi1/sayi2).toString();
        history=sayi1.toString()+operation.toString()+sayi2.toString();
      }
    }else{
      res=int.parse(texttodis + deger).toString();
    }
    setState(() {
      texttodis=res;
    });
  }
}

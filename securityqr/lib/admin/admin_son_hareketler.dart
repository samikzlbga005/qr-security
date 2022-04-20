import 'package:flutter/material.dart';

class admin_son_hareketler extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _admin_son_hareketler();

}

class _admin_son_hareketler extends State<admin_son_hareketler>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Son kullanıcı Harketleri"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5,5,5,0),
              height: 100,
              width: double.maxFinite,
              child: Card(
                color: Colors.amber,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Burada son hareketler görünecek",style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
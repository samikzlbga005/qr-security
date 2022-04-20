import 'package:flutter/material.dart';

class kullanicilar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _kullanicilar();

}

class _kullanicilar extends State<kullanicilar>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
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
                    Text("Ad Soyad: Sami KIZILBOĞA ",style: TextStyle(fontSize: 18),),
                    Text("E - Mail: sami@gmail.com ",style: TextStyle(fontSize: 18),),
                    Text("Kullanıcı No ",style: TextStyle(fontSize: 18),),
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
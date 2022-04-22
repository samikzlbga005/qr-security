import 'package:flutter/material.dart';

class kullaniciyi_gor extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _kullaniciyi_gor();

}

class _kullaniciyi_gor extends State<kullaniciyi_gor>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("qr Okunan Sayfa"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Text("asd")
            ],
          ),
        ),
      ),
    );
  }

}
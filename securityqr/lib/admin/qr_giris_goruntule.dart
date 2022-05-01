import 'package:flutter/material.dart';

class qr_giris_goruntule extends StatefulWidget{

final String Kno;

qr_giris_goruntule(this.Kno);

  @override
  State<StatefulWidget> createState() => _qr_giris_goruntule();

}

class _qr_giris_goruntule extends State<qr_giris_goruntule>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Giriş Görüntüle"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("asd:" + widget.Kno),
          ],
        ),
      ),
    );
  }

}
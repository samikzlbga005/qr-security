import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class qr_giris_goruntule extends StatefulWidget{

final String tarih;
final String Kno;
final String kadsoyad;

qr_giris_goruntule(this.Kno,this.tarih,this.kadsoyad);

  @override
  State<StatefulWidget> createState() => _qr_giris_goruntule();

}

class _qr_giris_goruntule extends State<qr_giris_goruntule>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Çıkış Saatleri"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(5,0,5,0),
                height: 150,
                width: double.maxFinite,
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Kullanıcı Ad Soyad: " + widget.kadsoyad),
                      Text("Kullanıcı No: " + widget.Kno),
                      Text("Tarih: " + widget.tarih),
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
import 'package:flutter/material.dart';
import 'kullanici_giris.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class kullanici_anasayfa extends StatefulWidget{

  final String Kisim;
  final String Kmail;
  final String Ktelefon;
  final String Karac;
  final String Kplaka;
  final String Kdaire;
  final int Kno;

  kullanici_anasayfa(this.Kisim,this.Kmail,this.Ktelefon,this.Kno,this.Karac,this.Kplaka,this.Kdaire);
  @override
  State<StatefulWidget> createState() =>_kullanici_anasayfa();

}
//

class _kullanici_anasayfa extends State<kullanici_anasayfa>{
  bool a = true;
CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('qr-security').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Anasayfa"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              QrImage(
                data: widget.Kno.toString(),
                size: 165,
                backgroundColor: Colors.white,
              ),  
              Container(
                padding: EdgeInsets.fromLTRB(5,0,5,0),
                height: 200,
                width: double.maxFinite,
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Ad Soyad: " + widget.Kisim),
                      Text("E - Mail: " + widget.Kmail),
                      Text("Telefon: " + widget.Ktelefon),
                      Text("Kullanıcı No: " + widget.Kno.toString()),
                      Text("Araç Markası: " + widget.Karac),
                      Text("Araç Plakası: " + widget.Kplaka),
                      Text("Daire No: " + widget.Kdaire),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:10),
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                color: Colors.blue,
                child: Text("Son Hareketler",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                  Navigator.pushNamed(context, "kullanici_son_hareketler");
                },
                ),
              ),
              Container(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(12, 10, 12, 10),
                color: Colors.blue,
                child: Text("Bilgileri Güncelle",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                  Navigator.pushNamed(context, "kullanici_bilgi_guncelle");
                },
                ),
              ),
              
              Container(
                child: FlatButton(
                  padding: EdgeInsets.fromLTRB(42, 10, 42 , 10), 
                color: Colors.blue,
                child: Text("Çıkış Yap",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                  Navigator.pushNamed(context, "/");
                },
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
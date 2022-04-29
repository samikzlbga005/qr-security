import 'package:flutter/material.dart';
import 'admin_giris.dart';

class admin_anasayfa extends StatefulWidget{

  final int adminNo;
  final String adminad;
  final String adminmail;
  final String admintelefon;

  admin_anasayfa(this.adminNo,this.adminad,this.adminmail,this.admintelefon);
  @override
  State<StatefulWidget> createState() =>_admin_anasayfa();

}

class _admin_anasayfa extends State<admin_anasayfa>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Anasayfa"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5,5,5,0),
              height: 200,
              width: double.maxFinite,
              child: Card(
                color: Colors.amber,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Ad Soyad: " +widget.adminad),
                    Text("E - Mail: " + widget.adminmail),
                    Text("Telefon: " + widget.admintelefon),
                    Text("Admin No: " +  widget.adminNo.toString()),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: FlatButton(
                padding: EdgeInsets.fromLTRB(20, 15, 10, 15),
              color: Colors.blue,
              child: Text("Son Hareketler",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "admin_son_hareketler");
              },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: FlatButton(
              padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
              color: Colors.blue,
              child: Text("Kullanıcılar",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "kullanicilar");
              },
              ),
            ),
             Container(
              padding: EdgeInsets.only(top:15),
              child: FlatButton(
              padding: EdgeInsets.fromLTRB(8, 15, 8 , 15),
              color: Colors.blue,
              child: Text("Bilgileri Güncelle",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "admin_bilgi_guncelle");
              },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:15),
              child: FlatButton(
              padding: EdgeInsets.fromLTRB(38, 15, 38 , 15),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "qr_oku");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt,
      ),
      ),
    );
  }

}
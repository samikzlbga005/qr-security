import 'package:flutter/material.dart';
import 'kullanicilar.dart';

class kullanici_bul extends StatefulWidget{
final String bul_isim;
final int bul_no;
final String bul_mail;
kullanici_bul(this.bul_no,this.bul_isim,this.bul_mail);

  @override
  State<StatefulWidget> createState() =>_kullanici_bul();

  

}

class _kullanici_bul extends State<kullanici_bul>{

  /*void kullanici_bilgileri_admine_goster(){
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return kullanici_bul(querySnapshot.docChanges[i].doc['kullanıcıno'], 
          querySnapshot.docChanges[i].doc['adsoyad'], 
          querySnapshot.docChanges[i].doc['mail'], 
          );
        }));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Anasayfa"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
              padding: EdgeInsets.fromLTRB(5,0,5,0),
              height: 100,
              width: double.maxFinite,
              child: Card(
                color: Colors.amber,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Ad Soyad: " + widget.bul_isim),
                    Text("E - Mail: " + widget.bul_mail),
                    Text("Kullanıcı No: " + widget.bul_no.toString()),
                  ],
                ),
              ),
            ),
            onTap: (){
              //Navigator.pushNamed(context, routeName)
            },
        ),
      ),
    );
  }

}

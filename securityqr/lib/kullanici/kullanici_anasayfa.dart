import 'package:flutter/material.dart';
import 'kullanici_giris.dart';

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

  void kullaniciGoster(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Anasayfa"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(30,20,30,0),
              height: 200,
              width: 200,
              child: Image.asset('resim/profil_resmi.jpg'),
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
              color: Colors.blue,
              child: Text("Son Hareketler",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "kullanici_son_hareketler");
              },
              ),
            ),
             Container(
              child: FlatButton(
              color: Colors.blue,
              child: Text("Bilgileri Güncelle",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "kullanici_bilgi_guncelle");
              },
              ),
            ),
            Container(
              child: FlatButton(
              color: Colors.blue,
              child: Text("QR oluştur",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                if(a)
                {
                  Navigator.pushNamed(context, "qr_olustur");
                  a = false;
                }
              },
              ),
            ),
            Container(
              child: FlatButton(
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
    );
  }

}
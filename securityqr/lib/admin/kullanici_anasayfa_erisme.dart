import 'package:flutter/material.dart';
import '../kullanici/kullanici_giris.dart';
import 'package:qr_flutter/qr_flutter.dart';
class kullanici_anasayfa_erisme extends StatefulWidget{

  final String Kisim;
  final String Kmail;
  final String Ktelefon;
  final String Karac;
  final String Kplaka;
  final String Kdaire;
  final int Kno;

  kullanici_anasayfa_erisme(this.Kisim,this.Kmail,this.Ktelefon,this.Kno,this.Karac,this.Kplaka,this.Kdaire);
  @override
  State<StatefulWidget> createState() =>_kullanici_anasayfa_erisme();

}
//

class _kullanici_anasayfa_erisme extends State<kullanici_anasayfa_erisme>{
  bool a = true;

  void kullaniciGoster(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Bilgileri"),
      ),
      body: Center(
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
              color: Colors.blue,
              child: Text("Son Hareketler",style: TextStyle(fontSize: 18,color: Colors.white),),
              onPressed: (){
                Navigator.pushNamed(context, "kullanici_son_hareketler");
              },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
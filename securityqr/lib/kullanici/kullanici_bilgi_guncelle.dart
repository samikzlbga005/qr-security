import 'package:flutter/material.dart';

class kullanici_bilgi_guncelle extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _kullanici_bilgi_guncelle();

}

class _kullanici_bilgi_guncelle extends State<kullanici_bilgi_guncelle>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilgileri Güncelle"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Ad Soyad',
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Mail',
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Şifre',
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Araç',
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Plaka',
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.center,
                  child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Daire No',
                  ),
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                height: 40,
                child: Text("Güncelle"),
                onPressed: (){
                  
                }
              ),
            ],
        ),
      ),
    );
  }

}
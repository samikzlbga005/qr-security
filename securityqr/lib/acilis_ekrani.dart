import 'package:flutter/material.dart';
import 'kullanici/kullanici_giris.dart';

class acilis_ekrani extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _acilis_ekran();

}

class _acilis_ekran extends State<acilis_ekrani>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('qrsecurity'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Kullanıcı Giriş",style: TextStyle(fontSize: 20.0),),
                onPressed: (){
                  Navigator.pushNamed(context, "kullanici_giris");
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Admin Giriş",style: TextStyle(fontSize: 20.0),),
                onPressed: (){
                  Navigator.pushNamed(context, "admin_giris");
                },
              ),
            ),
          ],
        ),
      ), 
    );
  }

}
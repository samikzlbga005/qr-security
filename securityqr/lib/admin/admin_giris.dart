import 'package:flutter/material.dart';

class admin_giris extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_admin_giris();
  
}

class _admin_giris extends State<admin_giris>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Giriş"),
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
                  labelText: 'Admin No',
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
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              height: 40,
              child: Text("Giriş Yap"),
              onPressed: (){
                Navigator.pushNamed(context, "admin_anasayfa");
              }
            ),
            TextButton(
              child: Text("Şifremi Unuttum"),
              onPressed: (){
                Navigator.pushNamed(context, "sifremi_unuttum");
              },
            ),
          ],
        ),
      ),
    );
  }

}


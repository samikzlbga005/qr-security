import 'package:flutter/material.dart';

class sifremi_unuttum extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_sifremi_unuttum();

}

class _sifremi_unuttum extends State<sifremi_unuttum>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifremi Unuttum"),
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
                  labelText: 'Mail Adresinizi Girin',
                ),
              ),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              height: 40,
              child: Text("Sıfırla"),
              onPressed: (){
              }
            ),
          ],
        ),
      ),
    );
  }

}
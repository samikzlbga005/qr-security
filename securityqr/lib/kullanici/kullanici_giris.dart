import 'package:flutter/material.dart';
import 'dart:math';

class kullanici_giris extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_kullanici_giris();
  
}

class _kullanici_giris extends State<kullanici_giris>{
  void kullanici_no(){
    int kullanici_no = 0;
    int random =Random().nextInt(99999);
    kullanici_no = random;
    debugPrint("$kullanici_no");  
    /* 
      if(kullanici_no == database)
        kullanici_no = random.next;
        kullanici_ekle();
      else
        kullanici_ekle();
    */                   


    /*
      void kullanici_ekle(){
        adsoyad_list.add([])
      }
     */         
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Giriş"),
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
                  labelText: 'Mail Adresi',
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
                Navigator.pushNamed(context, "kullanici_anasayfa");
              }
            ),
            TextButton(
              child: Text("Şifremi Unuttum"),
              onPressed: (){
                Navigator.pushNamed(context, "sifremi_unuttum");
              },
            ),
            //kayıt olma alerti
            TextButton(
              child: Text("Kayıt Ol"),
              onPressed: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Kayıt Ol'),
                      content: Container(
                        height: 200,
                        child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                            hintText: 'Ad Soyad',
                          ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                            hintText: 'Mail Adresi',
                          ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                            hintText: 'Cep Telefonu',
                          ),
                          ),
                        ],
                      ),
                    ),
                      
                    actions: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Kayıt Ol'),
                            onPressed: () {
                              kullanici_no();
                              Navigator.pop(context);
                            },
                          ),
                          FlatButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Text('Kapat'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
            
                    ],
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }

}


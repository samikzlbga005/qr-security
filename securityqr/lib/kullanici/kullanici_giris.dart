import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:securityqr/kullanici/kullanici_anasayfa.dart';

class kullanici_giris extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_kullanici_giris();
  
}

class _kullanici_giris extends State<kullanici_giris>{

  //database
  CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('qr-security').snapshots();

  //değişkenler
  bool first = false;
  

  final girismailcontroller = TextEditingController();
  final girissifrecontroller = TextEditingController();

 
  bool giris = true;
  int sayac =0;

  //fonksiyonlar

  void girisYap()async{
    //kullanıcı giriş fonksiyonu
    QuerySnapshot querySnapshot = await ref.get();
     for(int i = 0 ; i < querySnapshot.size ; i++)
     {
      if((girismailcontroller.text == querySnapshot.docChanges[i].doc['mail']) & (girissifrecontroller.text == querySnapshot.docChanges[i].doc['sifre'])){
          
            debugPrint("dogruuuu");
            //giris = false;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
              return kullanici_anasayfa(querySnapshot.docChanges[i].doc['adsoyad'], 
              querySnapshot.docChanges[i].doc['mail'], 
              querySnapshot.docChanges[i].doc['telefon'], 
              querySnapshot.docChanges[i].doc['kullanıcıno'], 
              querySnapshot.docChanges[i].doc['arac'], 
              querySnapshot.docChanges[i].doc['daireno'], 
              querySnapshot.docChanges[i].doc['plaka']);
            }));
            sayac ++;
      }
    }

    if(sayac == 0){
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text('Kullanıcı adı veya şifre yanlış!',
          style: TextStyle(fontSize: 25)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                girismailcontroller.text ="";
                girissifrecontroller.text ="";
              },
              child: new Container(
                  alignment: Alignment.center,
                  child: Text('TAMAM',style: TextStyle(fontSize: 25),),
              ) 
            ),
          ],
        ));
        sayac = 0;
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("something is wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                
                
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Kullanıcı Giriş"),
            ),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        child: TextField(
                        controller: girismailcontroller,
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
                        controller: girissifrecontroller,
                        decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Şifre',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:25),
                      child: FlatButton(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        color: Colors.blue,
                        textColor: Colors.white,
                        height: 40,
                        child: Text("Giriş Yap"),
                        onPressed: (){
                          girisYap();
                          //Navigator.pushNamed(context, "kullanici_anasayfa");
                        }
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: TextButton(
                        child: Text("Şifremi Unuttum"),
                        onPressed: (){
                          Navigator.pushNamed(context, "sifremi_unuttum");
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Checkbox(  
                            value: this.first,  
                            onChanged: (bool? value) {  
                                setState(() {  
                                  this.first = value!;   
                                });  
                            },  
                          ),
                          Text("Kullanıcı bilgilerini hatırla"),  
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        }
      )
    );
  }

}

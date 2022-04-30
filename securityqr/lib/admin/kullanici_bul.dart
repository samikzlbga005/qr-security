import 'package:flutter/material.dart';
import 'package:securityqr/kullanici/kullanici_anasayfa.dart';
import 'kullanicilar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'kullanici_anasayfa_erisme.dart';

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
  CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');
  
  void kullaniciya_git(int kullanici_no)async{
    QuerySnapshot querySnapshot = await ref.get();
    for(int i =0; i<querySnapshot.size;i++){
      if(kullanici_no == querySnapshot.docChanges[i].doc['kullanıcıno']){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return kullanici_anasayfa_erisme(
            querySnapshot.docChanges[i].doc['adsoyad'], 
            querySnapshot.docChanges[i].doc['mail'], 
            querySnapshot.docChanges[i].doc['telefon'], 
            querySnapshot.docChanges[i].doc['kullanıcıno'],
            querySnapshot.docChanges[i].doc['arac'],
            querySnapshot.docChanges[i].doc['plaka'],
            querySnapshot.docChanges[i].doc['daireno'],
          );
        }));
      }
    }
  }

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
                  kullaniciya_git(widget.bul_no);
                },
            ),
          ),
    );
  }

}






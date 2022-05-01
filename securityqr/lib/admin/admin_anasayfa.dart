import 'package:flutter/material.dart';
import 'package:securityqr/kullanici/kullanici_anasayfa.dart';
import 'admin_giris.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class admin_anasayfa extends StatefulWidget{

  final int adminNo;
  final String adminad;
  final String adminmail;
  final String admintelefon;

  admin_anasayfa(this.adminNo,this.adminad,this.adminmail,this.admintelefon);
  @override
  State<StatefulWidget> createState() =>_admin_anasayfa();

}

class _admin_anasayfa extends State<admin_anasayfa>{

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('qr-security').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');

  final adcontroller = TextEditingController();
  final sifrecontroller = TextEditingController();
  final mailcontroller = TextEditingController();
  final telefoncontroller = TextEditingController();
  final araccontroller = TextEditingController();
  final plakacontroller = TextEditingController();
  final dairecontroller = TextEditingController();

  bool sayac = true;
  bool giris = true;

  List<String>adlist = [];
  List<String>maillist = [];
  List<String>telefonlist = [];
  List<String>araclist = [];
  List<String>plakalist = [];
  List<String>dairelist = [];

  late int deger = 0;

  late String ad = "";
  late String mail = "";
  late String sifre = "";
  late String telefon = "";
  late String arac = "";
  late String plaka = "";
  late String daire = "";
  int kullanicino = 0;

  void kullanici_no() async {
    //bu fonksiyon kullanıcı no oluşturmaktadır
    QuerySnapshot querySnapshot = await ref.get();
    int random = Random().nextInt(99999);
    kullanicino = random;

    for(int i = 0;i < querySnapshot.size;i++)
    {
      if(kullanicino == querySnapshot.docChanges[i].doc['kullanıcıno']){
        sayac = false;
        break;
      }
      debugPrint("$i");
    }
  
    if(sayac){
      ekle(kullanicino);
    }
    else{ 
        kullanicino = random;
        sayac = true;
        ekle(kullanicino);
    }       
  }

  //kullanıcı ekleme
  void ekle(int id)async{
    QuerySnapshot querySnapshot = await ref.get();
    setState(() {
      ad = adcontroller.text;
    mail = mailcontroller.text;
    sifre = sifrecontroller.text;
    telefon = telefoncontroller.text;
    arac = araccontroller.text;
    plaka = plakacontroller.text;
    daire = dairecontroller.text;
    adcontroller.clear();
    mailcontroller.clear();
    telefoncontroller.clear();
    araccontroller.clear();
    plakacontroller.clear();
    dairecontroller.clear();
    sifrecontroller.clear();

    adlist.add(ad);
    maillist.add(mail);
    telefonlist.add(telefon);
    araclist.add(arac);
    plakalist.add(plaka);
    dairelist.add(daire);

    ref.add({
      "kullanıcıno": id,
      'adsoyad': ad,
      'mail': mail,
      'sifre':sifre,
      'telefon': telefon,
      'arac': arac,
      'plaka': plaka,
      'daireno': daire,
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Anasayfa"),
      ),
      body:SingleChildScrollView(
        child:  Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5,5,5,0),
                height: 200,
                width: double.maxFinite,
                child: Card(
                  color: Colors.amber,
                  elevation: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Ad Soyad: " +widget.adminad),
                      Text("E - Mail: " + widget.adminmail),
                      Text("Telefon: " + widget.admintelefon),
                      Text("Admin No: " +  widget.adminNo.toString()),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top:15),
                  child: FlatButton(
                  padding: EdgeInsets.fromLTRB(20, 15, 10, 15),
                  color: Colors.blue,
                  child: Text("Son Hareketler",style: TextStyle(fontSize: 18,color: Colors.white),),
                  onPressed: (){
                    Navigator.pushNamed(context, "admin_son_hareketler");
                  },
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top:15),
                  child: FlatButton(
                  padding: EdgeInsets.fromLTRB(30, 13, 30, 13),
                  color: Colors.blue,
                  child: Text("Kullanıcılar",style: TextStyle(fontSize: 18,color: Colors.white),),
                  onPressed: (){
                    Navigator.pushNamed(context, "kullanicilar");
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:15),
                child: FlatButton(
                padding: EdgeInsets.fromLTRB(21, 13, 21, 13),
                color: Colors.blue,
                child: Text("Kullanıcı Ekle",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SingleChildScrollView(
                        child: AlertDialog(
                          title: Text('Kullanıcı Ekle'),
                          content: Container(
                            height: 340,
                            child: Column(
                            children: <Widget>[
                              TextField(
                                controller: adcontroller,
                                decoration: InputDecoration(
                                hintText: 'Ad Soyad',
                                ),
                              ),
                              TextField(
                                controller: mailcontroller,
                                decoration: InputDecoration(
                                hintText: 'Mail Adresi',
                                ),
                              ),
                              TextField(
                                controller: sifrecontroller,
                                decoration: InputDecoration(
                                hintText: 'Şifre',
                                ),
                              ),
                              TextField(
                                controller: telefoncontroller,
                                decoration: InputDecoration(
                                hintText: 'Cep Telefonu',
                                ),
                              ),
                              TextField(
                                controller: araccontroller,
                                decoration: InputDecoration(
                                hintText: 'Araç Markası',
                                ),
                              ),
                              TextField(
                                controller: plakacontroller,
                                decoration: InputDecoration(
                                hintText: 'Araç Plakası',
                                ),
                              ),
                              TextField(
                                controller: dairecontroller,
                                decoration: InputDecoration(
                                hintText: 'Daire No',
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
                                child: Text('Ekle'),
                                onPressed: () {
                                  setState(() {
                                    kullanici_no();
                                    Navigator.pop(context);
                                  });
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
                      ),
                    );
                  });
                },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:15),
                child: FlatButton(
                padding: EdgeInsets.fromLTRB(8, 15, 8 , 15),
                color: Colors.blue,
                child: Text("Bilgileri Güncelle",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: (){
                  Navigator.pushNamed(context, "admin_bilgi_guncelle");
                },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top:15),
                child: FlatButton(
                padding: EdgeInsets.fromLTRB(38, 15, 38 , 15),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "qr_oku");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.camera_alt,
      ),
      ),
    );
  }

}
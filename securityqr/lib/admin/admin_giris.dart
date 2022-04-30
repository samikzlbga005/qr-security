import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

import 'package:securityqr/admin/admin_anasayfa.dart';

class admin_giris extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_admin_giris();
  
}

class _admin_giris extends State<admin_giris>{

  CollectionReference refadmin = FirebaseFirestore.instance.collection('admin');
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('admin').snapshots();

  late String adminad = "";
  late String adminmail = "";
  late String admintelefon ="";
  late String adminsifre = "";

  List<String>adminadlist = [];
  List<String>adminmaillist = [];
  List<String>admintelefonlist = [];


  final adminadcontroller = TextEditingController();
  final adminmailcontroller = TextEditingController();
  final admintelefoncontroller = TextEditingController();
  final adminsifrecontroller = TextEditingController();

  final admingirismailcontroller = TextEditingController();
  final admingirissifrecontroller = TextEditingController();

  int adminNo = 0;
  bool adminsayac = true;
  bool admingiris = true;
  int sayac = 0;

  void AdminGirisYap()async{
    QuerySnapshot querySnapshot = await refadmin.get();
     for(int i = 0;i < querySnapshot.size;i++)
    {
      if((admingirismailcontroller.text == querySnapshot.docChanges[i].doc['adminmail']) & (admingirissifrecontroller.text == querySnapshot.docChanges[i].doc['adminsifre'])){
         //debugPrint("dogruuuu");
        admingiris = false;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
          return admin_anasayfa(querySnapshot.docChanges[i].doc['adminNo'], 
          querySnapshot.docChanges[i].doc['adminad'], 
          querySnapshot.docChanges[i].doc['adminmail'], 
          querySnapshot.docChanges[i].doc['admintelefon'], 
          );
        }));
        sayac++;
        break;
      }
    }
    if(sayac ==0){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Kullanıcı adı veya şifre yanlış!',
            style: TextStyle(fontSize: 25)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  admingirismailcontroller.text ="";
                  admingirissifrecontroller.text ="";
                },
                child: new Container(
                    alignment: Alignment.center,
                    child: Text('TAMAM',style: TextStyle(fontSize: 25),),
                ) 
              ),
            ],
          ));
      }
  }

  void adminNoEkle() async{
    QuerySnapshot querySnapshot = await refadmin.get();
    int random = Random().nextInt(99999);
    adminNo = random;
    for(int i = 0;i < querySnapshot.size;i++)
    {
      if(adminNo == querySnapshot.docChanges[i].doc['adminNo']){
        adminsayac = false;
        break;
      }
      debugPrint("$i");
    }
  
    if(adminsayac){
      adminekle(adminNo);
    }
    else{ 
        adminNo = random;
        adminsayac = true;
        adminekle(adminNo);
    }       
  }


  void adminekle(int adminNo){
    setState(() {
      adminad = adminadcontroller.text;
      adminmail = adminmailcontroller.text;
      admintelefon = admintelefoncontroller.text;
      adminsifre = adminsifrecontroller.text;
      adminadcontroller.clear();
      adminmailcontroller.clear();
      admintelefoncontroller.clear();
      //adminsifrecontroller.clear();

      adminadlist.add(adminad);
      adminmaillist.add(adminmail);
      admintelefonlist.add(admintelefon);

      refadmin.add({
        'adminNo': adminNo,
        'adminad': adminad,
        'adminmail': adminmail,
        'adminsifre': adminsifre,
        'admintelefon': admintelefon,
      });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Giriş"),
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
                  controller: admingirismailcontroller,
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
                  controller: admingirissifrecontroller,
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
                  //Navigator.pushNamed(context, "admin_anasayfa");
                  AdminGirisYap();
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
            //kayıt olma alerti
                    TextButton(
                      child: Text("Kayıt Ol"),
                      onPressed: (){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: Text('Kayıt Ol'),
                                content: Container(
                                  height: 220,
                                  child: Column(
                                  children: <Widget>[
                                    TextField(
                                      controller: adminadcontroller,
                                      decoration: InputDecoration(
                                      hintText: 'Ad Soyad',
                                      ),
                                    ),
                                    TextField(
                                      controller: adminmailcontroller,
                                      decoration: InputDecoration(
                                      hintText: 'Mail Adresi',
                                      ),
                                    ),
                                    TextField(
                                      controller: adminsifrecontroller,
                                      decoration: InputDecoration(
                                      hintText: 'Şifre',
                                      ),
                                    ),
                                    TextField(
                                      controller: admintelefoncontroller,
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
                                        setState(() {
                                          adminNoEkle();
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
          ],
        ),
      ),
      ),
    );
  }

}


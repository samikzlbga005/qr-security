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
  final adcontroller = TextEditingController();
  final sifrecontroller = TextEditingController();
  final mailcontroller = TextEditingController();
  final telefoncontroller = TextEditingController();
  final araccontroller = TextEditingController();
  final plakacontroller = TextEditingController();
  final dairecontroller = TextEditingController();

  final girismailcontroller = TextEditingController();
  final girissifrecontroller = TextEditingController();

  List<String>adlist = [];
  List<String>maillist = [];
  List<String>telefonlist = [];
  List<String>araclist = [];
  List<String>plakalist = [];
  List<String>dairelist = [];

  late String ad = "";
  late String mail = "";
  late String sifre = "";
  late String telefon = "";
  late String arac = "";
  late String plaka = "";
  late String daire = "";
  int kullanicino = 0;
  bool sayac = true;
  bool giris = true;
  

  //fonksiyonlar

  void girisYap()async{
    //kullanıcı giriş fonksiyonu
    QuerySnapshot querySnapshot = await ref.get();
     for(int i = 0;i < querySnapshot.size;i++)
    {
      if(girismailcontroller.text == querySnapshot.docChanges[i].doc['mail']){
          if(girissifrecontroller.text == querySnapshot.docChanges[i].doc['sifre']){
            //debugPrint("dogruuuu");
            giris = false;
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
              return kullanici_anasayfa(querySnapshot.docChanges[i].doc['adsoyad'], 
              querySnapshot.docChanges[i].doc['mail'], 
              querySnapshot.docChanges[i].doc['telefon'], 
              querySnapshot.docChanges[i].doc['kullanıcıno'], 
              querySnapshot.docChanges[i].doc['arac'], 
              querySnapshot.docChanges[i].doc['daireno'], 
              querySnapshot.docChanges[i].doc['plaka']);
            }));
            break;
          }
      }
      else{
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
          break;
      }
      debugPrint("$i");
    }
  }

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
  void ekle(int id){
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
    Navigator.pop(context);
    
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
                                      child: Text('Kayıt Ol'),
                                      onPressed: () {
                                        setState(() {
                                          kullanici_no();
                                        //ekle();
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

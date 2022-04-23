import 'package:flutter/material.dart';
import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
  final mailcontroller = TextEditingController();
  final telefoncontroller = TextEditingController();
  final araccontroller = TextEditingController();
  final plakacontroller = TextEditingController();
  final dairecontroller = TextEditingController();

  List<String>adlist = [];
  List<String>maillist = [];
  List<String>telefonlist = [];
  List<String>araclist = [];
  List<String>plakalist = [];
  List<String>dairelist = [];

  late String ad = "";
  late String mail = "";
  late String telefon = "";
  late String arac = "";
  late String plaka = "";
  late String daire = "";
  int kullanicino = 0;
  bool sayac = true;
  

  //fonksiyonlar
  void kullanici_no() async {
    //bu fonksiyon 
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
        kullanicino = 88;
        sayac = true;
        ekle(kullanicino);
    }

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

  void ekle(int id){
    setState(() {
      ad = adcontroller.text;
    mail = mailcontroller.text;
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
      appBar: AppBar(
        title: Text('İş Listesi'),
      ),
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
                            return SingleChildScrollView(
                              child: AlertDialog(
                                title: Text('Kayıt Ol'),
                                content: Container(
                                  height: 300,
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

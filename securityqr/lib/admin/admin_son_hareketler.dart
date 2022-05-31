import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'kullanici_bul.dart';
class admin_son_hareketler extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _admin_son_hareketler();

}

class _admin_son_hareketler extends State<admin_son_hareketler>{

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('GirisCikis').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('GirisCikis');
  //CollectionReference refqrsec = FirebaseFirestore.instance.collection('qr-securtiy');
  final kullanicicontroller = TextEditingController();

/*
  void bul()async{
    late bool isFind = true;
    QuerySnapshot querySnapshot = await refqrsec.get();
    QuerySnapshot querySnapshot2 = await ref.get();

    for(int i = 0; i < querySnapshot.size;i++){
      if((kullanicicontroller.text == querySnapshot2.docChanges[i].doc['kno'].toString()) | (kullanicicontroller.text == querySnapshot2.docChanges[i].doc['kadsoyad'])){
        //Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return kullanici_bul(querySnapshot2.docChanges[i].doc['kno'], 
          querySnapshot2.docChanges[i].doc['adsoyad'], 
          querySnapshot2.docChanges[i].doc['mail'], 
          );
        }));
        isFind = false;
        kullanicicontroller.clear();
      }
    }
      if(isFind){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Böyle bir kullanıcı bulunamadı',
            style: TextStyle(fontSize: 25)),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  kullanicicontroller.clear();
                  Navigator.pop(context);
                },
                child: new Container(
                    alignment: Alignment.center,
                    child: Text('TAMAM',style: TextStyle(fontSize: 25),),
                ) 
              ),
            ],
          ));
          isFind = true;
      }
  }*/
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Harketleri"),
        actions: <Widget>[
          Container(
            child: IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: AlertDialog(
                      title: Text('Kullanıcı Bul'),
                      content: Container(
                        height: 50,
                        child: Column(
                        children: <Widget>[
                          TextField(
                            controller: kullanicicontroller,
                            decoration: InputDecoration(
                            hintText: 'Kullanıcı No veya Ad Soyad',
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
                            child: Text('Bul'),
                            onPressed: () {
                              //bul();
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
        ],
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
          return Container(
                child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index){
                  return Container(
                    padding: EdgeInsets.fromLTRB(5,5,5,0),
                    height: 120,
                    width: double.maxFinite,
                    child: GestureDetector(
                      child: Card(
                      color: Colors.amber,
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Ad Soyad: " + snapshot.data!.docChanges[index].doc['kadsoyad'],),
                          Text("Kullanıcı No: " +  snapshot.data!.docChanges[index].doc['kno'],),
                          Text("Tarih " +  snapshot.data!.docChanges[index].doc['tarih'].toString(),),
                    ],
                  ),  
                ),
              ),
            );      
              } 
            ),
          );
        }
      ),
    );         
  }

}
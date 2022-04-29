import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'kullanici_bul.dart';

class kullanicilar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _kullanicilar();

}

class _kullanicilar extends State<kullanicilar>{
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('qr-security').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');
  final kullanicicontroller = TextEditingController();

  void bul()async{
    QuerySnapshot querySnapshot = await ref.get();

    for(int i = 0; i < querySnapshot.size;i++){
      if(kullanicicontroller.text == querySnapshot.docChanges[i].doc['adsoyad']){
        //Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
          return kullanici_bul(querySnapshot.docChanges[i].doc['kullanıcıno'], 
          querySnapshot.docChanges[i].doc['adsoyad'], 
          querySnapshot.docChanges[i].doc['mail'], 
          );
        }));
        kullanicicontroller.clear();
      }
      else{
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
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
                            hintText: 'Kullanıcı Ad Soyad',
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
                            Navigator.pop(context);
                              bul();
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
                itemBuilder: (context,index){
                  return Container(
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
                    height: 120,
                    width: double.maxFinite,
                    child: Card(
                      color: Colors.amber,
                      elevation: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Ad Soyad: " + snapshot.data!.docChanges[index].doc['adsoyad'],style: TextStyle(fontSize: 22),),
                          Text("Mail: " +  snapshot.data!.docChanges[index].doc['mail'],style: TextStyle(fontSize: 22),),
                          Text("Kullanıcı No: " +  snapshot.data!.docChanges[index].doc['kullanıcıno'].toString(),style: TextStyle(fontSize: 22),),
                    ],
                  ),  
                ));      
              } 
            ),
          ); 
        }
      )
      
      
      /*
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(5,5,5,0),
              height: 100,
              width: double.maxFinite,
              child: Card(
                color: Colors.amber,
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Ad Soyad: Sami KIZILBOĞA ",style: TextStyle(fontSize: 18),),
                    Text("E - Mail: sami@gmail.com ",style: TextStyle(fontSize: 18),),
                    Text("Kullanıcı No ",style: TextStyle(fontSize: 18),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }

}
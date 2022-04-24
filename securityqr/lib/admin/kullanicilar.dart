import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class kullanicilar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _kullanicilar();

}

class _kullanicilar extends State<kullanicilar>{
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('qr-security').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('qr-security');
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
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
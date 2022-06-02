import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class kullanici_son_hareketler extends StatefulWidget{
/*
  final String knoo;
  kullanici_son_hareketler(this.knoo);*/
  @override
  State<StatefulWidget> createState() => _kullanici_son_hareketler();

}

class _kullanici_son_hareketler extends State<kullanici_son_hareketler>{
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('sd').snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcı Harketler"),
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
                          Text("Ad Soyad: "),
                          
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:securityqr/admin/qr_giris_goruntule.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class qr_oku extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _qr_oku();

}

class _qr_oku extends State<qr_oku>{
  
  final GlobalKey qrKey = GlobalKey(debugLabel: 'OK');
  Barcode? result;
  QRViewController? controller;

  String tarih = DateFormat('dd/MM/yyyy kk.mm').format(DateTime.now());


  CollectionReference ref = FirebaseFirestore.instance.collection('GirisCikis');
  CollectionReference refqrsec = FirebaseFirestore.instance.collection('qr-security');
  //final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('GirisCikis').snapshots();

  late String adsoyad = "";
  int indexxx = 0;

  void databaseGuncelle()async{
    QuerySnapshot querySnapshot = await refqrsec.get();
      for(int i = 0; i < querySnapshot.size; i++){
        if(result!.code == querySnapshot.docChanges[i].doc['kullanıcıno'].toString()){
          adsoyad = querySnapshot.docChanges[i].doc['adsoyad'];
          debugPrint("sdfsdfgdsffhfhjfghjghjkghjlhjklşjklkhjhfgfd");
        }
    }
  }
/*
  void bilgiGetir(String qrdataa)async{
    QuerySnapshot querySnapshot = await refqrsec.get();
      for(int i = 0; i < querySnapshot.size; i++){
        if(qrdataa == querySnapshot.docChanges[i].doc['kullanıcıno'].toString()){
          adsoyad = querySnapshot.docChanges[i].doc['adsoyad'];
          debugPrint(adsoyad);
          i = querySnapshot.size;
        }
    }
    kullaniciGirisCikis(adsoyad);
    }*/

  void kullaniciGirisCikis(String kadsoyad){
    ref.add({
      'tarih': tarih,
      'kadsoyad':kadsoyad,
      'kno':"${result!.code}",
    });
    /*
    String id = ref.doc().firestore.;
    debugPrint(id);
    debugPrint("22222222222222222222222");*/
    databaseGuncelle();
  }

  @override
  void ressemble(){
    super.reassemble();
    if(Platform.isIOS){
      controller!.pauseCamera();
    }else if(Platform.isAndroid){
      controller!.resumeCamera();
    }
  }

  //final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: QRView(key: qrKey, onQRViewCreated: onQRViewCreated),
        ), 
      ],
    ),
  ); 
}
  void onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
     
      setState(() async{
        result = scanData;
        controller.pauseCamera();
        if(result!=null){
          //bilgiGetir(result!.code.toString());
          QuerySnapshot querySnapshot = await refqrsec.get();
      for(int i = 0; i < querySnapshot.size; i++){
        if(result!.code.toString() == querySnapshot.docChanges[i].doc['kullanıcıno'].toString()){
          adsoyad = querySnapshot.docChanges[i].doc['adsoyad'];
          debugPrint(adsoyad);
          i = querySnapshot.size;
        }
    }
    kullaniciGirisCikis(adsoyad);
          debugPrint("sdgfsfgdsfgfdhgfdgh");
          //Text("${result!.code}");
          
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) {
                  //return qr_giris_goruntule("${result!.code}");
                  return qr_giris_goruntule(result!.code.toString(),tarih,adsoyad);
                }));
                
    }
    else{
      Text("scan data");
    }
      });
     }); 
  }
 
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io';

class qr_oku extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _qr_oku();

}

class _qr_oku extends State<qr_oku>{
  final GlobalKey qrKey = GlobalKey(debugLabel: 'OK');
  Barcode? result;
  QRViewController? controller;

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
      appBar: AppBar(
        title: Text("Qr Kod Okuma"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(key: qrKey, onQRViewCreated: onQRViewCreated),
        ), 
        Expanded(
          flex: 1,
          child: Center(
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              height: 40,
              child: Text("Sayfaya git"),
              onPressed: (){
                goster();
              }
            ),
          ),
        ), 
      ],
    ),
  ); 
}
  void onQRViewCreated(QRViewController controller){
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
     }); 
  }
  void goster(){
    if(result!=null){
      Navigator.pushNamed(context,"kullaniciyi_gor");
      /*
      Text("${describeEnum(result!.format)} data: ${result!.code}");
      */
      
      
    }
    else{
      Text("scan data");
    }
  }
  @override
  void dispose(){
    controller?.dispose();
    super.dispose();
  }
}
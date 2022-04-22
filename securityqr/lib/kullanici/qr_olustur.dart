import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class qr_olustur extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _qr_olustur();

}

class _qr_olustur extends State<qr_olustur>{

  final controller = TextEditingController();
  String qrData = "";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Oluştur"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              QrImage(
                data: qrData,
                size: 200,
                backgroundColor: Colors.white,
              ),
              SizedBox(height: 40,),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  suffixIcon: IconButton(icon: Icon(Icons.done, size: 30,),
                    onPressed: (){
                      if (controller.text.isEmpty) {        //a little validation for the textfield
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = controller.text;
                    });
                  }

                    },
                  ),
                  labelText: 'Kullanıcı no',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
import 'package:flutter/material.dart';
import "package:get/get.dart";



class LoadingDialog {


  Future<void> loading(BuildContext context) async {
    showDialog(
      barrierDismissible: false, 
      context: context, 
      builder: (context) {
        return Dialog(
          child: Container(
            height: 100,
            width: 100,
            padding: EdgeInsets.all(20),
            child: Column(
              children: const [
                CircularProgressIndicator(),
                Text("Loading...")
              ]
            )
          )
        );
      }
      
      
    );

  }

  Future<void> hideLoading(BuildContext context) async {
    Navigator.of(context).pop();
  }
  


}
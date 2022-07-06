import 'package:flutter/material.dart';
import 'package:user_management/pages/styles/backgrounds.dart';

class InfoDialog {


  Future<void> showInfoDIalog(BuildContext context, String message, String header) async{

    showDialog(
      barrierDismissible: false, 
      context: context, 
      builder: (context) {
        return Dialog(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: 150,
            width: 250,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  header,
                  style: TextStyle(
                    fontSize: 25  
                  )
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19
                  )
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    gradient: Backgrounds.greenGradient(),
                    borderRadius: BorderRadius.circular(5)
                  ),

                  child: TextButton(
                    onPressed: Navigator.of(context).pop,
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 20
                      )
                    )
                  )
                )
              ]
            )
          )
        );
      }
    );

  }

}
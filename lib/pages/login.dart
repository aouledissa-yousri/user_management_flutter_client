import 'package:flutter/material.dart';
import "styles/all.dart";


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(0),
              child: TextButton(
                onPressed: (){this.back(context);},
                child: Icon(Icons.arrow_back)
              )
            ),

            Container(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              )
            )
          ]
        )
      )
    );
  }

  void back(BuildContext context){
    Navigator.pop(context);
  }
}
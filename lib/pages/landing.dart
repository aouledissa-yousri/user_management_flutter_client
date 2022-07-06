import 'package:flutter/material.dart';
import "login.dart";
import "sign_up.dart";
import "styles/all.dart";




class LadingPage extends StatelessWidget {
  const LadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Backgrounds.blueGradient()
      ),
    

      child: Column(


        children: [

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Welcome", 
                style: TextStyle(
                  fontSize: 50, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            )
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)

              ),
              child: TextButton(

                style: ButtonStyle(
                  overlayColor: Splashes.transparentSplash(),
                  padding: MaterialStateProperty.all(EdgeInsets.all(30))
                ),

                onPressed: (){this.navigate("Sign up", context);}, 
                child: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
                ), 
              )
            )
          ),

          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white)

              ),
              child: TextButton(
                onPressed: (){this.navigate("Login", context);}, 

                style: ButtonStyle(
                  overlayColor: Splashes.transparentSplash(),
                  padding: MaterialStateProperty.all(EdgeInsets.all(30))
                ),

                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  )
                ), 
              )
            )
          )

        ],
      )
    );
  }



  void navigate(String keyword, BuildContext context){
    dynamic destination;
    if(keyword == "Sign up"){
      destination = SignUpPage();
    }else if (keyword == "Login"){
      destination = LoginPage();
    }

    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => destination,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:user_management/dialogs/LoadingDialog.dart';
import 'package:user_management/forms/SignUpForm.dart';
import '../models/User.dart';
import "../forms/SignUpForm.dart";
import "styles/all.dart";
import "../services/api_service.dart";

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  Icon _eyeIcon = Icon(Icons.visibility_off);
  bool _hiddenPassword = true;


  SignUpForm signUpForm = new SignUpForm();



  

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
                child: Icon(Icons.arrow_back, size: 30,)
              )
            ),

            Container(
              child: Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              )
            ),

            Container(
              margin: EdgeInsets.only(top: 40),

              child: Form(
                key: this.signUpForm.formkey,
                onChanged: (){this.signUpForm.activateSubmit(setState);},
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width/1.05,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value){this.signUpForm.checkUsername();},
                        onChanged: (value){this.signUpForm.usernameField.setTouched(true);},
                        onFieldSubmitted: (value){},
                        controller: this.signUpForm.usernameField.getController(),
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          labelText: "Username",
                          errorText: this.signUpForm.checkUsername(),
                        ),
                      )
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.05,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value){this.signUpForm.checkEmail();},
                        onChanged: (value){this.signUpForm.emailField.setTouched(true);},
                        onFieldSubmitted: (value){},
                        controller: this.signUpForm.emailField.getController(),
                        decoration: InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText: "ex: xyz@gmail.com",
                          labelText: "Email address",
                          errorText: this.signUpForm.checkEmail()
                        ),
                      )
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width/1.05,
                      margin: EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        validator: (value){this.signUpForm.checkPassword();},
                        onFieldSubmitted: (value){},
                        onChanged: (value){this.signUpForm.passwordField.setTouched(true);},
                        controller: this.signUpForm.passwordField.getController(),
                        decoration: InputDecoration(
                          labelText: "Password",
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: (){this.showOrHidePassword(this._hiddenPassword);},
                            icon: this._eyeIcon,
                          ),
                          errorText: this.signUpForm.checkPassword()
                        ),
                        obscureText: this._hiddenPassword,
                      )
                    ),

                    Opacity(
                      opacity: this.signUpForm.isValid()["opacity"],
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.05,
                        margin: EdgeInsets.only(top: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: Backgrounds.blueGradient(),
                          borderRadius: BorderRadius.circular(5)
                        ),

                        child: TextButton(
                          onPressed: this.signUpForm.submitButtonActive? signUp : null,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                            )
                          ),

                          style: ButtonStyle(
                            overlayColor: this.signUpForm.submitButtonState()
                          )

                        )
                      
                      )
                    )

                  ]
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

  void showOrHidePassword(bool hiddenPassword){
    setState((){
      this._hiddenPassword = !hiddenPassword;
      this.setEyeIcon(hiddenPassword);

    });
  }


  void setEyeIcon(bool hiddenPassword){
    if(hiddenPassword)
      this._eyeIcon = Icon(Icons.visibility);
    else 
      this._eyeIcon = Icon(Icons.visibility_off);

  }

  Future<void> signUp() async {
    User user = this.signUpForm.getData();
    var result = await ApiService.signUp(user, context);
    print(result);
    this.signUpForm.clear();
  }

  
}
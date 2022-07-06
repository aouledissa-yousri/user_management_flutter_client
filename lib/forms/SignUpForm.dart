import "package:flutter/material.dart";
import '../models/User.dart';
import "./Form.dart";
import "./TextInput.dart";



class SignUpForm extends FormTemp{


  TextInput usernameField = new TextInput();
  TextInput emailField = new TextInput();
  TextInput passwordField = new TextInput();



  String? checkUsername(){
    if(this.usernameField.isEmpty()&& this.usernameField.isVisited())
      return "Username is required";
    else if(this.usernameField.isVisited())
      return null;
  }

  String? checkPassword(){
    if(this.passwordField.isEmpty() && this.passwordField.isVisited())
      return "Password is required";
    else if(this.passwordField.isVisited())
      return null;
  }

  String? checkEmail(){
    if(this._checkEmailPattern(this.emailField.getValue()))
      return null;
    else if (this.emailField.isVisited())
      return "The email address you provided is not valid";
  }


  bool _checkEmailPattern(String email){
    return RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email); 
  }

  User getData(){
    return new User(
      this.usernameField.getValue(),
      this.emailField.getValue(),
      this.passwordField.getValue()
    );
  }

  @override
  bool validateForm(){
    return this._checkEmailPattern(this.emailField.getValue()) && !this.usernameField.isEmpty() && !this.passwordField.isEmpty();
  }

  @override
  void clear(){
    super.clear();
    this.usernameField.clear();
    this.passwordField.clear();
    this.emailField.clear();
  }





}
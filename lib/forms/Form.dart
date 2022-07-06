import 'package:flutter/material.dart';
import '../pages/styles/all.dart';

abstract class FormTemp{
  
  final formkey = GlobalKey<FormState>();
  bool touched = false;
  bool submitButtonActive = false;

  void activateSubmit(Function setState){
    setState((){this.submitButtonActive = this._formIsValid();});
  }

  Map<String, dynamic> isValid(){
    double opacity = (this.submitButtonActive) ? 1.0 : 0.5;
    return {
      "opacity": opacity,
      "valid": this.submitButtonActive
    };
  }

  MaterialStateProperty<Color?>? submitButtonState(){
    MaterialStateProperty<Color?>? buttonState = this.isValid()["valid"] ? Splashes.transparentSplash() : null; 
    return buttonState;
  }

  bool _formIsValid(){
    bool condition = this.validateForm();
    return condition;
  }

  bool validateForm();

  

  void clear(){
    this.submitButtonActive = false;

  }
}
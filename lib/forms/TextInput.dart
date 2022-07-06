import "package:flutter/material.dart";


class TextInput{

  TextEditingController field = new TextEditingController(text: "");
  bool touched = false;


  void setTouched(bool state){
    this.touched = state;
  }

  bool isVisited(){
    return this.touched == true;
  }

  bool isEmpty(){
    return this.field.value.text.isEmpty;
  }

  String getValue(){
    return this.field.text;
  }

  void clear(){
    this.field.clear();
    this.setTouched(false);
  }

  TextEditingController getController(){
    return this.field;
  }

}
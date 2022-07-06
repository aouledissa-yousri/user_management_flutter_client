

import 'package:flutter/material.dart';

class Backgrounds {


  static LinearGradient blueGradient(){
    return  const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
      Color(0xff045de9),
      Color(0xff09c6f9)
      ]
    );             
  }


  static LinearGradient greenGradient(){
    return const LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        Color(0xff17f9f2),
        Color(0xffb0f9a9)
      ]
    );
  }


}
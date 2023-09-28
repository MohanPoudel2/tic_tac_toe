import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles{

  static final myTextStyle=TextStyle(color: Colors.white,fontSize: 30);
  static final appbarText=TextStyle( color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
  static final displayxoText=TextStyle( color: Colors.white, fontSize: 30, fontWeight: FontWeight.normal);
  static var myNewfont=GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.black,letterSpacing: 3));
  static var myNewfontWhite=GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white,letterSpacing: 3,fontSize: 15));


}
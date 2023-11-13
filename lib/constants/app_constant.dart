import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const anaRenk = Colors.blueGrey;
  static const baslikText = "OrtalamaHesapla";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
    fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);

  static final TextStyle dersSayisiStyle = GoogleFonts.quicksand(
    fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blueAccent
  );

  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
    fontSize: 24, fontWeight: FontWeight.w800, color: Colors.blueAccent
  );

  static final TextStyle OrtalamaGosterBodyStyle = GoogleFonts.quicksand(
    fontSize: 16, fontWeight: FontWeight.w800, color: Colors.blueAccent
  );

  static final dropDownPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 7);
  
}
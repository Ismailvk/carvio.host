import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class AppFonts {
  static TextStyle sansitaFont = GoogleFonts.poppins(
      textStyle: const TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold));

  static TextStyle popins =
      GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.grey));

  static TextStyle sansitaFontred = GoogleFonts.sansita(
      textStyle: const TextStyle(fontSize: 17, color: Colors.red));

  static TextStyle sansitaFontWhite = GoogleFonts.sansita(
      textStyle: const TextStyle(fontSize: 17, color: Colors.white));

  static TextStyle sansitaFontGrey = GoogleFonts.sansita(
      textStyle: TextStyle(fontSize: 16, color: Colors.grey.shade600));

  static TextStyle appbarSansitaFont = GoogleFonts.sansita(
      textStyle: const TextStyle(fontSize: 20, color: Colors.black));

  static TextStyle sansitaFontBlack = GoogleFonts.sansita(
      textStyle: const TextStyle(fontSize: 16, color: Colors.black));

  static TextStyle popinsSub =
      GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.black));

  static TextStyle popinsGreen = GoogleFonts.poppins(
      textStyle: const TextStyle(color: Colors.green, fontSize: 17));

  static TextStyle popinsSubRed =
      GoogleFonts.poppins(textStyle: const TextStyle(color: Colors.red));

  static TextStyle popinsHeading =
      GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 17));

  static TextStyle sansCaption = GoogleFonts.ptSansCaption(
      fontWeight: FontWeight.bold, color: Colors.teal.shade400, fontSize: 24);

  static TextStyle normal =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static TextStyle appbarTitle =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600);

  static TextStyle ibmsans =
      GoogleFonts.ibmPlexSans(fontWeight: FontWeight.bold, fontSize: 21);

  static TextStyle ibmsansGrey = GoogleFonts.ibmPlexSans(
      fontWeight: FontWeight.bold, fontSize: 19, color: Colors.grey);
}

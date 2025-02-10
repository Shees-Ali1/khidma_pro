// lib/styles/text_styles.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts package
import '../consts/colors.dart';

class TextStyles {
  static TextStyle bottomNavText() {
    return GoogleFonts.jost( // Use GoogleFonts to load the font
      fontWeight: FontWeight.w500, // Set the weight
      fontSize: 12.sp, // Set the size in sp for scaling
      height: 14.45 / 10, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: backgroundColor, // Set the text color
    );
  }


  static TextStyle titleText() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.bold, // Set bold weight for title
      fontSize: 18.sp, // Set the size in sp for scaling
      height: 22.23 / 18, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: blackColor, // Set the text color (you can adjust it)
    );
  }

  static TextStyle titleTextBig() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.bold, // Set bold weight for title
      fontSize: 24.sp, // Set the size in sp for scaling
      height: 22.23 / 18, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: blackColor, // Set the text color (you can adjust it)
    );
  }

  static TextStyle smallTextBlack() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.w400, // Set bold weight for title
      fontSize: 16.sp, // Set the size in sp for scaling
      height: 22.23 / 18, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: blackColor, // Set the text color (you can adjust it)
    );
  }

  static TextStyle smallContainerText() {
    return GoogleFonts.sora( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.w600, // Set bold weight for title
      fontSize: 10.sp, // Set the size in sp for scaling
      height: 22.23 / 18, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: whiteColor, // Set the text color (you can adjust it)
    );
  }

  static TextStyle announcementsText() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.w600
      , // Set bold weight for title
      fontSize: 14.sp, // Set the size in sp for scaling
      height: 22.23 / 18, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: backgroundColor, // Set the text color (you can adjust it)
    );
  }
  static TextStyle announcementsDateText() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.normal
      , // Set bold weight for title
      fontSize: 9.sp, // Set the size in sp for scaling
      height: 22.23 / 20, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: backgroundColor, // Set the text color (you can adjust it)
    );
  } static TextStyle dropDownText() {
    return GoogleFonts.jost( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.normal
      , // Set bold weight for title
      fontSize: 11.sp, // Set the size in sp for scaling
      height: 22.23 / 20, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: backgroundColor, // Set the text color (you can adjust it)
    );
  }
  static TextStyle availability() {
    return GoogleFonts.inter( // Use GoogleFonts to load the Jost font
      fontWeight: FontWeight.w600
      , // Set bold weight for title
      fontSize: 16.sp, // Set the size in sp for scaling
      height: 22.23 / 20, // Set line height (line height / font size)
      letterSpacing: 0, // Set letter spacing
      color: skyblue, // Set the text color (you can adjust it)
    );
  }
}

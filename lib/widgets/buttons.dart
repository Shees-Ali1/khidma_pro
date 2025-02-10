import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:khidma_pro/consts/colors.dart'; // Import your colors file

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color color;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;

   CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height = 51,
    this.width, // Optional width
    Color? color, // Nullable color parameter
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.w600,
    this.fontSize = 16,
  }) : color = color ?? skyblue; // Assign default value in the constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13.3), // Radius 13.3 px
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.jost(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

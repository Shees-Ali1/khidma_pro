import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:khidma_pro/consts/colors.dart';

class CustomInputField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final bool obscureText;
  final String? svgIconPath;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? hintTextColor;
  final double? hintTextSize;
  final Color? labelTextColor;
  final double? labelTextSize;
  final bool alignLabelWithHint;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChanged;
  final int? maxLines;
  final bool readOnly;
  final double? height; // New height parameter

  CustomInputField({
    this.controller,
    this.label,
    this.obscureText = false,
    this.svgIconPath,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.hintText,
    this.hintTextColor,
    this.hintTextSize,
    this.labelTextColor,
    this.labelTextSize,
    this.alignLabelWithHint = false,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.maxLines,
    this.contentPadding,
    this.readOnly = false,
    this.height, // Allow height customization
  });

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50.h, // Default height of 50
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.start,
        cursorColor: blackColor,
        style: TextStyle(
          color: skyblue,
          fontSize: widget.hintTextSize ?? 14.65.sp,
          fontWeight: FontWeight.bold,
          fontFamily: 'Jost',
        ),
        maxLines: widget.maxLines ?? 1,
        readOnly: widget.readOnly,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: textfieldColor,
          filled: true,
          labelText: widget.label,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintTextColor ?? skyblue,
            fontSize: widget.hintTextSize ?? 14.65.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Jost',
          ),
          labelStyle: TextStyle(
            color: widget.labelTextColor ?? skyblue,
            fontSize: widget.labelTextSize ?? 14.65.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'Jost',
          ),
          alignLabelWithHint: widget.alignLabelWithHint,
          prefixIcon: widget.prefixIcon ??
              (widget.svgIconPath != null
                  ? Padding(
                padding: EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  widget.svgIconPath!,
                  fit: BoxFit.scaleDown,
                  width: 15.26.w,
                  height: 12.97.h,
                ),
              )
                  : null),
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: _togglePasswordVisibility,
          )
              : widget.suffixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.31.r),
            borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
            borderRadius: BorderRadius.circular(13.31.r),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: textfieldBorder, width: 0.95.w),
            borderRadius: BorderRadius.circular(13.31.r),
          ),
          contentPadding: widget.contentPadding,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,

      ),
    );
  }
}

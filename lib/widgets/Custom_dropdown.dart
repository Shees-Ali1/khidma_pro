import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/images.dart';

class CustomDropdownField extends StatefulWidget {
  final String? label;
  final String? hintText;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final Color? labelTextColor;
  final double? labelTextSize;
  final Color? hintTextColor;
  final double? hintTextSize;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  final double? height;
  final String? dropdownIconImage; // Custom dropdown icon

  CustomDropdownField({
    this.label,
    required this.items,
    this.selectedValue,
    this.onChanged,
    this.labelTextColor,
    this.labelTextSize,
    this.hintText,
    this.hintTextColor,
    this.hintTextSize,
    this.prefixIcon,
    this.contentPadding,
    this.height,
    this.dropdownIconImage, // Custom dropdown icon
  });

  @override
  _CustomDropdownFieldState createState() => _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends State<CustomDropdownField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50.h, // Default height
      child: DropdownButtonFormField<String>(
        value: _selectedValue,
        icon: SizedBox.shrink(), // Removes default dropdown arrow
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              height: 18.h,
              width: 18.w,
              child: widget.prefixIcon ?? Image.asset(gender),
            ),
          ),
          suffixIcon: widget.dropdownIconImage != null
              ? Padding(
            padding: const EdgeInsets.all(21.0),
            child: Image.asset(
              widget.dropdownIconImage!,
              width: 20.w,
              height: 20.h,
            ),
          )
              : null, // Removes default suffix icon if no custom image is provided
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
        items: widget.items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(
            item,
            style: TextStyle(
              color: skyblue,
              fontSize: 14.65.sp,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jost',
            ),
          ),
        ))
            .toList(),
        onChanged: (value) {
          setState(() {
            _selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
      ),
    );
  }
}

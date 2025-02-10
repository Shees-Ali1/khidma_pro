import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khidma_pro/consts/colors.dart';
import 'package:khidma_pro/consts/text_styles.dart';

class CustomSmallContainers extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final Color? color; // Default color
  final Color? selectedColor; // Color when selected
  final Color? unselectedColor; // Color when not selected
  final bool isSelected; // Selection state
  final double? borderRadius;
  final double? iconSize;
  final double? spacing;
  final String? iconAsset;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? iconPadding;
  final VoidCallback? onTap;

  const CustomSmallContainers({
    Key? key,
    required this.text,
    this.height,
    this.width,
    this.color,
    this.selectedColor,
    this.unselectedColor,
    this.isSelected = false,
    this.borderRadius,
    this.iconSize,
    this.spacing,
    this.iconAsset,
    this.textStyle,
    this.iconPadding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 30.h,
        width: width ?? 100.w,
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? greyColor)
              : (unselectedColor ?? skyblue),
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          boxShadow: [
            BoxShadow(
              color: const Color(0x22222608), // rgba(34, 34, 38, 0.08)
              offset: const Offset(0, 4),
              blurRadius: 6,
            ),
            BoxShadow(
              color: const Color(0x26222626), // rgba(34, 34, 38, 0.15)
              offset: const Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconAsset != null)
              SizedBox(
                height: iconSize ?? 18.sp,
                width: iconSize ?? 18.sp,
                child: Padding(
                  padding: iconPadding ?? EdgeInsets.zero,
                  child: Image.asset(iconAsset!),
                ),
              ),
            if (iconAsset != null) SizedBox(width: spacing ?? 5),
            Text(
              text,
              style: textStyle ?? TextStyles.smallContainerText(),
            ),
          ],
        ),
      ),
    );
  }
}

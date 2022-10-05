import 'package:alexis/ui/components/text_widgets.dart';
import 'package:alexis/ui/utils/colors.dart';
import 'package:flutter/material.dart';

Widget buttonWithBorder(
  String text, {
  Color? buttonColor,
  Color? textColor,
  Function()? onTap,
  Color? borderColor,
  FontWeight? fontWeight,
  double? fontSize,
  double? horiMargin,
  double? borderRadius,
  String? icon,
  Color? iconColor,
  double? height,
  double? width,
  bool busy = false,
  bool isActive = true,
  bool isGradient = true,
}) {
  return InkWell(
    onTap: isActive ? (busy ? null : onTap) : null,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
          gradient: isGradient
              ? const LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [AppColors.primary, AppColors.red],
                )
              : null,
          color: isActive ? buttonColor : buttonColor!.withOpacity(.6),
          borderRadius: BorderRadius.circular(borderRadius ?? 4.h),
          border: Border.all(
              width: 1.h,
              color: isActive
                  ? isGradient
                      ? Colors.transparent
                      : (borderColor ?? Colors.transparent)
                  : const Color(0xffF6F6F6))),
      child: Center(
          child: busy
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(right: 12.h),
                        child: Image.asset(
                          'assets/images/$icon.png',
                          height: 24.h,
                          width: 24.h,
                          color: iconColor,
                        ),
                      ),
                    regularText(
                      text,
                      color: isActive ? textColor : textColor!.withOpacity(.6),
                      fontSize: fontSize,
                      fontWeight: fontWeight ?? FontWeight.w700,
                    ),
                  ],
                )),
    ),
  );
}

Widget buttonWithBorder2(
  String text, {
  Color? buttonColor,
  Color? textColor,
  Function()? onTap,
  Color? borderColor,
  FontWeight? fontWeight,
  double? fontSize,
  double? horiMargin,
  double? borderRadius,
  String? icon,
  Color? iconColor,
  double? height,
  double? width,
  bool busy = false,
  bool isActive = true,
}) {
  return InkWell(
    onTap: isActive ? (busy ? null : onTap) : null,
    child: Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: horiMargin ?? 0),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [AppColors.primary, AppColors.red],
          ),
          color: isActive ? buttonColor : buttonColor!.withOpacity(.6),
          borderRadius: BorderRadius.circular(borderRadius ?? 4.h),
          border: Border.all(
              width: 1.h,
              color: isActive
                  ? (borderColor ?? Colors.transparent)
                  : const Color(0xffF6F6F6))),
      child: Center(
          child: busy
              ? SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (icon != null)
                      Padding(
                        padding: EdgeInsets.only(right: 12.h),
                        child: Image.asset(
                          'assets/images/$icon.png',
                          height: 24.h,
                          width: 24.h,
                          color: iconColor,
                        ),
                      ),
                    regularText(
                      text,
                      color: isActive ? textColor : textColor!.withOpacity(.6),
                      fontSize: fontSize,
                      fontWeight: fontWeight ?? FontWeight.w600,
                    ),
                  ],
                )),
    ),
  );
}

class NavButton extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;
  const NavButton({
    Key? key,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      height: 40.w,
      width: 40.w,
      decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: AppColors.grey2),
          borderRadius: BorderRadius.circular(12.r)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Icon(
          iconData,
          size: 12.h,
        ),
      ),
    );
  }
}

import 'package:alexis/ui/components/text_widgets.dart';
import 'package:alexis/ui/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? title;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextAlign? textAlign;
  final Function(String?)? onChanged;
  final Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;
  final bool? enabled;
  final bool obscureText;
  final bool isPhone;
  final String? authPrefix;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String? obscuringCharacter;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  const CustomTextField({
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.textInputType,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.obscuringCharacter,
    this.maxLines = 1,
    this.onTap,
    this.autoFocus = false,
    this.focusNode,
    this.maxLength,
    this.title,
    this.enabled,
    this.suffix,
    this.inputFormatters,
    this.isPhone = false,
    this.authPrefix,
    this.width,
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _hasFocus = false;
  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        _hasFocus = hasFocus;
        setState(() {});
      },
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.title != null)
              Row(
                mainAxisAlignment:
                    (widget.title == 'To' || widget.title == 'From')
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h),
                    child: regularText(
                      widget.title!,
                      fontSize: 12.sp,
                      color: _hasFocus ? AppColors.primary : AppColors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            TextFormField(
              cursorColor: AppColors.black.withOpacity(0.4),
              cursorWidth: 1.h,
              focusNode: widget.focusNode,
              maxLines: widget.maxLines,
              autofocus: widget.autoFocus,
              enabled: widget.enabled ?? true,
              maxLength: widget.maxLength,
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14.sp,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
              ),
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.all(15.h),
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.grey2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                fillColor: AppColors.white,
                errorStyle: TextStyle(
                  color: AppColors.red,
                  fontSize: 10.5.sp,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: widget.isPhone
                    ? IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  regularText(
                                    '+234',
                                    color: _hasFocus
                                        ? AppColors.primary
                                        : AppColors.grey2,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                            VerticalDivider(
                                color: _hasFocus
                                    ? AppColors.primary
                                    : AppColors.grey2,
                                thickness: 1.h)
                          ],
                        ),
                      )
                    : widget.authPrefix != null
                        ? SizedBox(
                            width: 40.h,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/${widget.authPrefix}.png',
                                  height: 20.h,
                                  width: 20.h,
                                  color: _hasFocus
                                      ? AppColors.primary
                                      : AppColors.grey2,
                                )
                              ],
                            ),
                          )
                        : widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                suffix: widget.suffix,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey2,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.grey2,
                    width: 1.h,
                  ),
                  borderRadius: BorderRadius.circular(8.h),
                ),
              ),
              obscureText: widget.obscureText,
              onTap: widget.onTap,
              obscuringCharacter: '●',
              controller: widget.controller,
              textAlign: widget.textAlign ?? TextAlign.start,
              keyboardType: widget.textInputType,
              validator: widget.validator,
              onChanged: widget.onChanged,
            )
          ],
        ),
      ),
    );
  }
}

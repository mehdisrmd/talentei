import 'package:flutter/material.dart';
import 'package:talentei/utils/general_color.dart';

class SignFormInput extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final Widget? icon;
  final bool isPassword;
  final TextDirection textDirection;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final bool hasError; // Add this property
  final String? errorText; // Add this property
  final String? Function(String?)? validation;
  final bool isValid; // Add this new property

  const SignFormInput({super.key, 
    required this.hint,
    required this.controller,
    required this.icon,
    required this.isPassword,
    required this.textDirection,
    required this.keyboardType,
    required this.textAlign,
    this.hasError = false, // Add this with default value false
    this.errorText,
    this.validation,
    this.isValid = false, // Add this with default value false
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        validator: validation,
        autovalidateMode: AutovalidateMode.onUserInteraction, // Add this line
        showCursor: false,
        textAlign: textAlign,
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: GeneralColor.textFormColor,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: GeneralColor.errorBorderColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            // Add text alignment for RTL
            leadingDistribution: TextLeadingDistribution.even,
          ),
          suffixIcon: icon,
          border: OutlineInputBorder(
            // Change this from InputBorder.none
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: isValid
                    ? GeneralColor.focusedBorderColor
                    : GeneralColor.defBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1,
                color: isValid
                    ? GeneralColor.focusedBorderColor
                    : GeneralColor.defBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide:
                BorderSide(width: 1, color: GeneralColor.errorBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedErrorBorder: OutlineInputBorder(
            // Add this
            borderSide:
                BorderSide(width: 1, color: GeneralColor.errorBorderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBorder: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: GeneralColor.hintFormColor,
          ),
          alignLabelWithHint: true,
          contentPadding:
              EdgeInsets.fromLTRB(10, 0, 10, 0), // Adjust padding for hint text
          errorText: hasError ? errorText : null, // Add this line
        ),
      ),
    );
  }
}

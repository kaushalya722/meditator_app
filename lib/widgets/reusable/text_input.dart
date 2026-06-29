import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';

class CustomTextFormFeild extends StatelessWidget {

  final String lableText;
  final String? hintText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final TextInputType keyBoardType;


  const CustomTextFormFeild({
    super.key, 
    required this.lableText, 
    this.hintText, 
    this.onSaved, 
    this.validator, 
    required this.keyBoardType
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: lableText,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryDarkBlue.withOpacity(0.8),
          ),
          borderRadius: BorderRadius.circular(100),
        )
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: keyBoardType,
    );
  }
}
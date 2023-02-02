import 'package:base_structure/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.themeData,
      required this.textEditingController,
      this.textInputAction});
  final TextEditingController textEditingController;
  final ThemeData themeData;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      cursorColor: themeData.colorScheme.primary,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: TextInputType.phone,
      textInputAction: textInputAction,
      style: themeData.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: AppTextFontSize.f18,
          color: themeData.colorScheme.onTertiary),
      maxLines: 1,
      decoration: InputDecoration(
          filled: true,
          fillColor: themeData.colorScheme.onTertiary.withOpacity(0.03),
          focusColor: themeData.colorScheme.primary,
          hintText: AppString.idAndPasswordHintText,
          hintStyle: themeData.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: AppTextFontSize.f18,
              color: themeData.colorScheme.secondaryContainer),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.colorScheme.primary),
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppBorderRadius.b100))),
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppBorderRadius.b100))),
          contentPadding: const EdgeInsets.symmetric(
              vertical: AppPadding.p16, horizontal: AppPadding.p18)),
      validator: (value) {
        if (value!.isEmpty) {
          return "This field must not be empty!!!";
        }
        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutterdatabase/res/app_colors.dart';
import 'package:flutterdatabase/res/app_styles.dart';

class TextInput {
  static TextFormField getTextFormField(String hint,
      {bool isPassword = false,
      Icon icon,
      Widget suffixIcon,
      bool autoValid = false,
      FocusNode focusNode,
      String value,
      String customValidator(String arg),
      String basicValidation,
      int maxLines = 1,
      int minLines,
      TextEditingController controller,
      bool readOnly = false,
      bool isEnabled = true,
      bool enableInteractiveSelection = true,
      ValueChanged<String> onFieldSubmitted,
      TextInputAction textInputAction = TextInputAction.next,
      TextCapitalization textCapitalization = TextCapitalization.sentences,
      TextInputType inputType = TextInputType.text}) {
    if (customValidator == null && basicValidation != null) {
      customValidator = (args) {
        if (args.isEmpty || args.trim().isEmpty) {
          return basicValidation;
        }
        return null;
      };
    }

    return TextFormField(
      readOnly: readOnly,
      autofocus: false,
      autovalidate: autoValid,
      obscureText: isPassword,
      keyboardType: inputType,
      initialValue: value,
      focusNode: focusNode,
      controller: controller,
      validator: customValidator,
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      maxLines: maxLines,
      minLines: minLines,
      enabled: isEnabled,
      style: TextStyle(
          fontFamily: AppStyles.FONT_MEDIUM,
          color: Colors.grey[800],
          fontSize: 15),
      onFieldSubmitted: onFieldSubmitted,
      enableInteractiveSelection: enableInteractiveSelection,
      decoration: InputDecoration(
        labelText: hint,
        isDense: true,
        alignLabelWithHint: true,
        hasFloatingPlaceholder: true,
        icon: icon,
        suffix: suffixIcon,
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[300]),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}

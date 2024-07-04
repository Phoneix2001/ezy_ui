

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final String? astrickSign;
  final String? Function(String?)? validator;
  final Function? onTap;
  final TextEditingController controller;
  final int? maxLength, maxLine, minLine;
  final Key? textFieldKey;
  final bool? expand;
  final bool? isEnabled;
  final bool? obscureText;
  final void Function(String)? onChange;
  final FocusNode? focusNode;
  final void Function()? onDoneClickInKeyboard;
  final AutovalidateMode? validationMode;
  final TextAlignVertical? textAlignVertical;
  final Widget? suffixIcon, prefixIcon;
  final List<TextInputFormatter>? inputFormat;
  final TextInputType keyboardType;
  final InputDecoration? inputDecoration;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enableInteractiveSelection;
  final bool? enabled, isSuffixIconVisible, isSpaceRestricted;
  final bool fadeText;
  final double? hintTextSize;
  final BoxConstraints? suffixIconConstraints;
  final bool? isCountVisible;
  final TextCapitalization? textCapitalization;
  const PrimaryTextField(
      {super.key,
        required this.keyboardType,
        required this.hintText,
        this.validator,
        required this.controller,
         this.inputFormat,
        this.astrickSign,
        this.maxLength,
        this.inputDecoration,
        this.isEnabled,
        this.contentPadding,
        this.expand,
        this.enableInteractiveSelection,
        this.onTap,
        this.textFieldKey,
        this.suffixIcon,
        this.obscureText = false,
        this.maxLine,
        this.minLine,
        this.enabled = true,
        this.onChange,
        this.textAlignVertical,
        this.prefixIcon,
        this.isSuffixIconVisible = false,
        this.focusNode,
        this.onDoneClickInKeyboard,
        this.validationMode,
        this.isSpaceRestricted = true,
        this.fadeText = false, this.hintTextSize, this.suffixIconConstraints,
        this.isCountVisible,  this.textCapitalization
      });

  @override
  Widget build(BuildContext context) {
    if (isSpaceRestricted!) {

      //inputFormat.add(FilteringTextInputFormatter.deny(RegExp(r'\s$')));
      inputFormat?.add(FilteringTextInputFormatter.deny(RegExp(r'^\s')));
      //inputFormat.add(NoEmojiInputFormatter());
    }

    return TextFormField(
      textCapitalization: (textCapitalization != null) ? textCapitalization! :
      (keyboardType == TextInputType.emailAddress
          || keyboardType == TextInputType.visiblePassword
          || keyboardType == TextInputType.url)
          ? TextCapitalization.none :TextCapitalization.sentences,
      onEditingComplete: onDoneClickInKeyboard,
      focusNode: focusNode,
      readOnly: false,
      autovalidateMode: validationMode,
      autocorrect: true,
      validator: validator,

      enableIMEPersonalizedLearning: true,
      enableSuggestions: true,
      magnifierConfiguration: TextMagnifier.adaptiveMagnifierConfiguration,
      key: textFieldKey,
      obscureText: obscureText!,
      obscuringCharacter: "∗",
      textAlignVertical: textAlignVertical,
      minLines: minLine,
      maxLines: maxLine,
      onTap: onTap != null ? onTap!() : null,
      expands: expand ?? false,
      controller: controller,
      inputFormatters: inputFormat,
      keyboardType: keyboardType,
      onChanged: onChange,
      enabled: isEnabled,

      maxLength: maxLength,
      textAlign: TextAlign.start,
      // enableInteractiveSelection: widget.enableInteractiveSelection ?? false,
      decoration: inputDecoration ??
          InputDecoration(
           
            enabled: enabled!,
            errorStyle: const TextStyle(height: 0),

            prefixIcon: prefixIcon,
            isDense: true,
            suffixIcon: isSuffixIconVisible! ? suffixIcon : null,
            counterText: isCountVisible==true?null
                :'',
            errorBorder: OutlineInputBorder(

                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1.5)),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 1.5)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide()),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                    )),
            filled: true,
            label: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: hintText,
                   
                  ),
                  TextSpan(
                      text: astrickSign ?? "",
                      style: Theme.of(context).textTheme.headlineSmall)
                ])),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            errorMaxLines: 15,
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            hintStyle: Theme.of(context).textTheme.headlineSmall,
          ),
    );
  }
}



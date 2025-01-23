
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../mixins & constants/constants.dart';
import '../input_borders_hub/input_border_hub.dart';

class CustomTextFormField extends StatefulWidget {
  final String labelText;
  final bool required;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final IconData? suffixIcon;
  final VoidCallback? onIconPressed;
  final Color borderColor;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final IconData? prefixIcon;
  final String? prefixText;
  final Color? prefixContainerColor;
  final bool isPrefixFilled;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final BorderSide? borderSideColor;
  dynamic validator;
  dynamic onChanged;
  int? maxLength;
  int? maxLines;
  Widget? suffix;
  bool showTitle;
  TextStyle? hintStyle;
  TextStyle? labelTextStyle;
  EdgeInsetsGeometry? contentPadding;
  double? borderRadius;
  double? borderWidth;
  Widget? prefix;
  bool isOutlinedBorder;
  bool? filled;
  Color? fillColor;
  double? height;
  double? width;

  CustomTextFormField({
    Key? key,
    this.prefixIconColor,
    this.borderSideColor,
    this.suffixIconColor,
    required this.labelText,
    required this.required,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.onIconPressed,
    this.borderColor = Colors.grey,
    this.focusNode,
    this.nextFocusNode,
    this.prefixIcon,
    this.prefixText,
    this.prefixContainerColor,
    this.isPrefixFilled = false, // Default to not filled
    this.validator,
    this.onChanged,
    this.maxLength,
    this.maxLines,
    this.suffix,
    this.hintStyle,
    this.contentPadding,
    this.showTitle = true,
    this.labelTextStyle,
    this.borderWidth,
    this.borderRadius,
    this.prefix,
    this.isOutlinedBorder = true,
    this.filled = false,
    this.fillColor,
    this.height,
    this.width
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    // creating border for text field
    final border = widget.isOutlinedBorder
        ? InputBordersHub.getOutlinedInputBorder(
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            borderRadius: widget.borderRadius)
        : InputBordersHub.getUnderlinedInputBorder(
            borderColor: widget.borderColor,
            borderWidth: widget.borderWidth,
            borderRadius: widget.borderRadius);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? Padding(
                padding: EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    fieldTitle(
                        text: widget.labelText,
                        textStyle: widget.labelTextStyle),
                    Text(
                      widget.required ? "*" : '',
                      // style: headingFields().copyWith(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w400,
                      //     color: Colors.red),
                    ),
                  ],
                ),
              )
            : kShowVoid,
        SizedBox(
          height: widget.height,
          width: widget.width,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            focusNode: widget.focusNode,
            maxLines: widget.maxLines,
            expands: false,

            /// If field is required then only validate the field
            validator: widget.required ? widget.validator : null,
            maxLength: widget.maxLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            onChanged: widget.onChanged,
            onFieldSubmitted: (_) {
              if (widget.nextFocusNode != null) {
                FocusScope.of(context).requestFocus(widget.nextFocusNode);
              }
            },
            decoration: InputDecoration(
                errorMaxLines: 100,
                hintText: widget.hintText,
                suffixIcon: widget.suffix,
                hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
                prefixIcon: widget.prefix,
                border: border,
                focusedBorder: border,
                enabledBorder: border,
                contentPadding: widget.contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                isCollapsed: false,
                isDense: false,
                filled: widget.filled ?? true,
                fillColor: widget.fillColor ?? Colors.white),
          ),
        ),
      ],
    );
  }
}

/// field label
Widget fieldTitle({required String text, TextStyle? textStyle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        text,
        // style: textStyle ??
        //     headingFields().copyWith(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

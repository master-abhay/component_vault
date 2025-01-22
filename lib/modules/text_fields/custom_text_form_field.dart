
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../mixins & constants/constants.dart';

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

  CustomTextFormField(
      {Key? key,
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
        this.showTitle = true
     })
      : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle ?  Padding(
          padding: EdgeInsets.only(
            bottom: 8,
          ),
          child:  Row(
            children: [
              fieldTitle(text: widget.labelText),
              Text(
                widget.required ? "*" : '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
            ],
          ),
        ) : kShowVoid,
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          focusNode: widget.focusNode,
          maxLines: widget.maxLines,

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
            hintStyle: const TextStyle(color: Colors.grey),
            // Prefix logic: combine prefixIcon and prefixText in a Row
            prefixIcon: (widget.prefixIcon != null || widget.prefixText != null)
                ? Container(
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        color: widget.isPrefixFilled &&
                                widget.prefixContainerColor != null
                            ? widget.prefixContainerColor
                            : Colors.transparent,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            topLeft: Radius.circular(7)),
                        border: Border(
                          right: widget.borderSideColor ?? BorderSide.none,
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (widget.prefixText != null)
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              widget.prefixText!,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        if (widget.prefixIcon != null)
                          Padding(
                              padding: const EdgeInsets.only(right: 4, left: 5),
                              child: Icon(widget.prefixIcon,
                                  color:
                                      widget.prefixIconColor ?? Colors.grey)),
                        if (widget.prefixIcon != null &&
                            widget.prefixText != null)
                          Container(color: Colors.grey, width: 0.5, height: 45),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.borderColor,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.borderColor,
                width: 1.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: widget.borderColor,
                width: 0.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ],
    );
  }
}

Widget fieldTitle({required String text}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        text,
        style:TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      ),
    ],
  );
}

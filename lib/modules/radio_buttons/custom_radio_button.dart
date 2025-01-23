
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/types/gf_radio_type.dart';

class CustomRadioListTile extends StatefulWidget {
  final dynamic value; // Value for the individual radio button
  final dynamic groupValue; // The current selected value for the group
  final ValueChanged<dynamic?> onChanged; // Callback for when the value changes
  final String title; // Title text for the list tile
  final TextStyle? textStyle; // Optional custom style for the text
  final EdgeInsets? padding; // Optional padding for the list tile
  FocusNode? focusNode;

  CustomRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
    this.textStyle,
    this.padding,
    this.focusNode

  });

  @override
  State<CustomRadioListTile> createState() => _CustomRadioListTileState();
}

class _CustomRadioListTileState extends State<CustomRadioListTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Call the onChanged callback with the new value when the list tile is tapped
        widget.onChanged(widget.value);
      },
      child: Container(
        padding: widget.padding ?? const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            GFRadio<dynamic>(
              focusNode: widget.focusNode,
              size: 20,
              activeBorderColor: Colors.black,
              inactiveBorderColor: Colors.black,
              value: widget.value, // Individual radio button value
              groupValue: widget.groupValue, // The currently selected value
              onChanged: widget.onChanged, // Callback for when value changes
              type: GFRadioType.basic,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                widget.title,
                style: widget.textStyle ?? const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

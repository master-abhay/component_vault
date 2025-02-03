import 'package:flutter/material.dart';

import '../mixins & constants/constants.dart';
import '../utils/utils.dart';

class CustomActionButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;
  final String name;
  final TextStyle? textStyle;

  const CustomActionButton({
    Key? key,
    required this.isLoading,
    required this.name,
    this.onPressed,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          isLoading
              ? Utils.pageLoadingIndicator(context: context)
              : Text(
            name,
            style: textStyle ??
                TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.black, // Default color
                ),
          ),
          kSmallSpace,
        ],
      ),
    );
  }
}

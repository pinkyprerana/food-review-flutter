import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String firstText;
  final String secondText;
  final TextStyle firstTextStyle;
  final TextStyle secondTextStyle;
  final TextAlign textAlign;

  const CustomRichText({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.firstTextStyle,
    required this.secondTextStyle,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        style: const TextStyle(height: 1.2), // Adjust the line height as needed
        children: [
          TextSpan(
            text: firstText,
            style: firstTextStyle,
          ),
          const TextSpan(
            text: " ",
          ),
          TextSpan(
            text: secondText,
            style: secondTextStyle,
          ),
        ],
      ),
    );
  }
}

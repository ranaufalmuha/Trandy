import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final double padding;
  final bool bold;
  const MyText({
    super.key,
    required this.text,
    required this.size,
    required this.color,
    required this.padding,
    required this.bold,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: size,
          color: color,
        ),
      ),
    );
  }
}

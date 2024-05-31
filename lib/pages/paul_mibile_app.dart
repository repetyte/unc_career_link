import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaulMibileApp extends StatelessWidget {
  const PaulMibileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: const BoxDecoration(
        color: Color(0xFF5CF659),
      ),
      child: Container(
        width: 1920,
        padding: const EdgeInsets.fromLTRB(0, 495.5, 1, 495.5),
        child: Text(
          'Graduate Tracking Industry',
          style: GoogleFonts.getFont(
            'Montserrat',
            fontWeight: FontWeight.w700,
            fontSize: 73,
            color: const Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final double angle;
  final bool isExpanded;

  const Logo({required this.angle, required this.isExpanded, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: isExpanded ? 20 : 70 - (angle * 4),
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '7',
                textAlign: TextAlign.left,
                style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                    fontSize: 60 - (angle * 4),
                    height: 0.9,
                    color: Colors.orange,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 50,
                      ),
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'SEVEN',
                textAlign: TextAlign.left,
                style: GoogleFonts.oswald(
                  textStyle: TextStyle(
                    fontSize: 60 - (angle * 4),
                    height: 0.9,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 50,
                      ),
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text(
            '    pizza',
            textAlign: TextAlign.left,
            style: GoogleFonts.oswald(
              textStyle: TextStyle(
                fontSize: 60 - (angle * 4),
                height: 0.9,
                color: Colors.orange,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 50,
                  ),
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

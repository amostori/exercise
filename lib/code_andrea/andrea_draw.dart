import 'package:flutter/material.dart';

import 'face_outline_painter.dart';

class AndreaDraw extends StatefulWidget {
  const AndreaDraw({super.key});

  @override
  State<AndreaDraw> createState() => _AndreaDrawState();
}

class _AndreaDrawState extends State<AndreaDraw> {
  final offsets = <Offset?>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.red,
        child: GestureDetector(
          onPanDown: (details) {
            setState(() {
              offsets.add(details.localPosition);
            });
          },
          onPanUpdate: (details) {
            setState(() {
              offsets.add(details.localPosition);
            });
          },
          onPanEnd: (details) {
            setState(() {
              offsets.add(null);
            });
          },
          child: Container(
            color: Colors.yellow,
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: FaceOutlinePainter(offsets: offsets),
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  final double score;
  final double size;
  final String circleText;
  final Color color;

  const CircleIndicator(this.score, this.size, {this.circleText, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CustomPaint(
            foregroundPainter: _CircleProgress(score, context, color),
            child: SizedBox(
                width: size,
                height: size,
                child: Center(
                    child: Text(circleText ?? '$score %',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))))));
  }
}

class _CircleProgress extends CustomPainter {
  double currentProgress;
  BuildContext context;
  Color customColor;

  static const WIDTH_CONTROL = 6.0;

  _CircleProgress(this.currentProgress, this.context, this.customColor);

  Color _color() {
    if (currentProgress >= 85) {
      return Colors.redAccent;
    } else if (currentProgress >= 60) {
      return Colors.amberAccent;
    }
    return Colors.greenAccent;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint outerCircle = Paint()
      ..strokeWidth = WIDTH_CONTROL
      ..color = Theme.of(context).brightness == Brightness.dark
          ? const Color.fromRGBO(255, 255, 255, 0.1)
          : const Color.fromRGBO(0, 0, 0, 0.1)
      ..style = PaintingStyle.stroke;

    final Paint completeArc = Paint()
      ..strokeWidth = WIDTH_CONTROL
      ..color = customColor ?? _color()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2) - WIDTH_CONTROL;

    canvas.drawCircle(center, radius, outerCircle);

    final double angle = 2 * pi * (currentProgress / 100);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius), -pi / 2, angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

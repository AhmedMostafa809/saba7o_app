import 'dart:math' as math;
import 'package:flutter/cupertino.dart';





class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double value;
  final Gradient gradient;

  const GradientCircularProgressIndicator({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientCircularProgressPainter(
        strokeWidth: strokeWidth,
        value: value,
        gradient: gradient,
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double value;
  final Gradient gradient;

  _GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.value,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: size.center(Offset.zero),
      radius: size.width / 2,
    );

    final progressPaint = Paint()
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double progressAngle = value * 2 * math.pi; // Convert value to angle

    final SweepGradient sweepGradient = SweepGradient(
      startAngle: 0.0,
      endAngle: progressAngle,
      tileMode: TileMode.clamp,
      center: Alignment.center,
      colors: gradient.colors,
      stops: gradient.stops,
    );

    progressPaint.shader = sweepGradient.createShader(rect);

    canvas.drawArc(rect, -math.pi / 2, progressAngle, false, progressPaint);
  }

  @override
  bool shouldRepaint(_GradientCircularProgressPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.gradient != gradient ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
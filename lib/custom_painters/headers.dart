import 'package:flutter/material.dart';

class HeadersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            painter: _ArchHeader(),
            child: Container(),
          )
        ],
      ),
    );
  }
}

class _DiagonalHeader extends CustomPainter {
  final Color color;
  final double dy1;
  final double dy2;
  final PaintingStyle style;
  final double strokeWidth;

  _DiagonalHeader({
    this.color = const Color(0xFF006d77),
    this.dy1 = 0.35,
    this.dy2 = 0.30,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = this.color;
    paint.style = this.style;
    paint.strokeWidth = this.strokeWidth;

    path.lineTo(0, size.height * this.dy1);
    path.lineTo(size.width, size.height * this.dy2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _WaverHeader extends CustomPainter {
  final Color color;
  final double q1;
  final double q2;
  final double waveSize;
  final double height;
  final PaintingStyle style;
  final double strokeWidth;

  _WaverHeader({
    this.color = const Color(0xFF006d77),
    this.q1 = 0.25,
    this.q2 = 0.75,
    this.height = 200,
    this.waveSize = 35,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = this.color;
    paint.style = this.style;
    paint.strokeWidth = this.strokeWidth;

    path.moveTo(0, this.height);
    path.quadraticBezierTo(size.width * this.q1, this.height + this.waveSize, size.width * (this.q1 * 2), this.height);
    path.quadraticBezierTo(size.width * this.q2, this.height - this.waveSize, size.width, this.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class _ArchHeader extends CustomPainter {
  final Color color;
  final double q1;
  final double archSize;
  final double height;
  final bool inverted;
  final PaintingStyle style;
  final double strokeWidth;

  _ArchHeader({
    this.color = const Color(0xFF006d77),
    this.q1 = 0.5,
    this.height = 200,
    this.archSize = 50,
    this.inverted = false,
    this.style = PaintingStyle.fill,
    this.strokeWidth = 10.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    final path = new Path();

    paint.color = this.color;
    paint.style = this.style;
    paint.strokeWidth = this.strokeWidth;

    path.moveTo(0, this.height);
    path.quadraticBezierTo(
      size.width * this.q1,
      (this.inverted) ?  this.height + this.archSize : this.height - this.archSize,
      size.width,
      this.height,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


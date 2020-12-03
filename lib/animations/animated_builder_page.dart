import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5000))..repeat();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: AnimatedBuilder(
                animation: _controller,
                builder: (BuildContext context, Widget child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: Transform.scale(
                        scale: _controller.value,
                        child: child
                    ),
                  );
                },
                child: FlutterLogo(
                  size: 150,
                )),
          ),
        ),
      ),
    );
  }
}

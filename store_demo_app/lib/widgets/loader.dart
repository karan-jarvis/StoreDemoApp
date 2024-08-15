import 'package:flutter/material.dart';
import 'dart:math';

class Loader extends StatefulWidget {
  final double radius;
  final double dotRadius;

  Loader({this.radius = 30.0, this.dotRadius = 3.0});

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation_rotation;
  late Animation<double> animation_radius_in;
  late Animation<double> animation_radius_out;

  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;

    controller = AnimationController(
        lowerBound: 0.0,
        upperBound: 1.0,
        vsync: this,
        duration: Duration(milliseconds: 3000));

    animation_rotation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_radius_in = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));

    animation_radius_out = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = widget.radius * animation_radius_in.value;
        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = widget.radius * animation_radius_out.value;
        }
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Container(
            child: Center(
              child: Stack(
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0.0, 0.0),
                    child: Dot(
                      radius: radius,
                      color: Colors.black12,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 1 * pi / 4),
                      radius * sin(0.0 + 1 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.amber,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 2 * pi / 4),
                      radius * sin(0.0 + 2 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(radius * cos(0.0 + 3 * pi / 4),
                        radius * sin(0.0 + 3 * pi / 4)),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 4 * pi / 4),
                      radius * sin(0.0 + 4 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.purple,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 5 * pi / 4),
                      radius * sin(0.0 + 5 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.yellow,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 6 * pi / 4),
                      radius * sin(0.0 + 6 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.lightGreen,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 7 * pi / 4),
                      radius * sin(0.0 + 7 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(
                      radius * cos(0.0 + 8 * pi / 4),
                      radius * sin(0.0 + 8 * pi / 4),
                    ),
                    child: Dot(
                      radius: 5.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;

  Dot({this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

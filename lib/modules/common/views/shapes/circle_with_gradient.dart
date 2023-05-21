import 'package:flutter/cupertino.dart';
import 'shape.dart';
import 'shape_size.dart';

class CircleWithGradient extends Shape {
  //MARK: init

  CircleWithGradient({Key? key, required this.radius, Widget? child, required this.gradient})
      : super(key: key, size: ShapeSize(height: radius, width: radius), child: child ?? const SizedBox());

  //MARK: properties

  final LinearGradient gradient;

  final double radius;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: gradient,
          boxShadow: const [BoxShadow(blurRadius: 10.0)]),
      height: size.height,
      width: size.width,
      child: child,
    );
  }
}

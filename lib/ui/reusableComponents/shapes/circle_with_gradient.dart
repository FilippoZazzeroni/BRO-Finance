import 'package:brofinance/mixins/global_context.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class CircleWithGradient extends Shape with GlobalContext {
  //MARK: init

  CircleWithGradient(
      {required this.radius, Widget? child, required this.gradient})
      : super(size: ShapeSize(height: radius, width: radius), child: child ?? const SizedBox());

  //MARK: properties

  final LinearGradient gradient;

  final double radius;

  //MARK: methods 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
          gradient: gradient, boxShadow: const [BoxShadow(blurRadius: 10.0)]),
      height: size.height,
      width: size.width,
      child: child,
    );
  }
}

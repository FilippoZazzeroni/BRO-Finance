import 'package:brofinance/mixins/global_context.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class RectangleWithGradient extends Shape with GlobalContext {
  //MARK: init

  RectangleWithGradient(
      {required ShapeSize size, Widget? child, required this.gradient, this.radius = 20.0})
      : super(size: size, child: child ?? const SizedBox());

  final LinearGradient gradient;
  
  final double radius;

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

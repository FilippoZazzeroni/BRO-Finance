import 'shape.dart';
import 'shape_size.dart';
import 'package:flutter/cupertino.dart';

class VerticalSpace extends Shape {
  //MARK: init

  VerticalSpace(double height, {Key? key})
      : super(
            key: key,
            child: SizedBox(
              height: height,
            ),
            size: ShapeSize(height: height, width: 0.0));

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

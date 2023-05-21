import 'package:flutter/cupertino.dart';
import 'shape_size.dart';

abstract class Shape extends StatelessWidget {
  //MARK: init
  const Shape({Key? key, required this.size, required this.child})
      : super(key: key);

  //MARK: properties

  final ShapeSize size;

  final Widget child;

  //MARK: methods
  @override
  Widget build(BuildContext context);
}

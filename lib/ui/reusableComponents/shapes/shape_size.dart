

import 'package:flutter/cupertino.dart';

class ShapeSize {

  //MARK: init

  ShapeSize({required this.height, required this.width});

  ShapeSize.fullScreen(BuildContext context) :
    height = MediaQuery.of(context).size.height,
    width = MediaQuery.of(context).size.width;

  ShapeSize.fullWidth({required double heightRectangle, required BuildContext context}) :
      width = MediaQuery.of(context).size.width,
      height = heightRectangle;

  //MARK: properties

  final double height;

  final double width;
}
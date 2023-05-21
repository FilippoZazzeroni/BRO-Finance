import 'package:flutter/material.dart';

extension SColors on Color {
  //MARK: properties

  static const primaryColor = Color.fromRGBO(255, 27, 107, 1.0);

  static const secondaryColor = Color.fromRGBO(69, 202, 255, 1.0);

  static const redDark = Color.fromRGBO(241, 81, 94, 1.0);

  static const blueDark = Color.fromRGBO(16, 55, 131, 1.0);

  //MARK: methods

  static LinearGradient getGradient(Color primary, Color secondary,
      {Alignment begin = Alignment.centerLeft,
      Alignment end = Alignment.centerRight}) {
    return LinearGradient(colors: [primary, secondary], begin: begin, end: end);
  }
}

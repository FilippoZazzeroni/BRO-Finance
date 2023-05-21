import 'package:flutter/material.dart';

extension CurrencyStyle on TextStyle {
  //MARK: properties

  /// white text color
  static final title = CurrencyStyle.getTitleFrom(Colors.white);

  /// white text color
  static final description = CurrencyStyle.getDescriptionFrom(Colors.white);

  //MARK: methods

  static TextStyle getTitleFrom(Color color, {double blurRadius = 5.0}) {
    return TextStyle(color: color, fontSize: 50.0, fontFamily: "AlfaSlab", shadows: [
      BoxShadow(
        blurRadius: blurRadius,
        color: color,
      )
    ]);
  }

  static TextStyle getDescriptionFrom(Color color, {double blurRadius = 5.0, double textSize = 30.0}) {
    return TextStyle(color: color, fontSize: textSize, fontFamily: "BebasNeue", shadows: [
      BoxShadow(
        blurRadius: blurRadius,
        color: color,
      )
    ]);
  }
}

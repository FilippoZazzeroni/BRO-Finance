import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:flutter/material.dart';

class CardSubView extends StatelessWidget {
  //MARK: init

  const CardSubView({Key? key, required this.title, required this.description}) : super(key: key);

  final String description;

  final String title;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
      size: ShapeSize.fullScreen(context),
      gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: CurrencyStyle.title,
          ),
          Text(
            description,
            style: CurrencyStyle.description,
          )
        ],
      ),
    );
  }
}

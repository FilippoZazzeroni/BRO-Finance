
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_button.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:flutter/cupertino.dart';

import '../coin.dart';

class TopBar extends StatelessWidget {

  //MARK: init

  const TopBar({Key? key, this.title = "BRO Finance",required this.style, required this.size}) : super(key: key);

  //MARK: properties

  final String title;

  final TopBarSize size;

  final TextStyle style;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
        size: ShapeSize.fullWidth(heightRectangle: size.height, context: context),
        gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
        child: Column(
          children: [

            Row(
              children: [
                TopBarButton.home(),
                TopBarButton.useCases(),
                TopBarButton.cryptoService(),
                TopBarButton.logIn()
              ],
            ),

            Row(
              children: [
                Text(title, style: style,),
                Coin(radius: size.height / 1.5)
              ],
            )
          ],
        ),
    );
  }






}
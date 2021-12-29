
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_button.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:brofinance/ui/views/crypto_service_view.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:flutter/cupertino.dart';

class TopBarLogged extends TopBar {
  TopBarLogged({Key? key}) : super(key: key, size: TopBarSize(70.0), style: CurrencyStyle.description);

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopBarButton(
              onPressed: () {
                pushRoute(context, const LandingView());
              },
              text: "home",
            ),
            TopBarButton(
              onPressed: () {
                pushRoute(context, const LandingView());
              },
              text: "log out",
            ),
            TopBarButton(
              onPressed: () {
                pushRoute(context, const CryptoServiceView());
              },
              text: "crypto service",
            )
          ],
        ),
        size: ShapeSize.fullWidth(heightRectangle: size.height, context: context), gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor));
  }

}
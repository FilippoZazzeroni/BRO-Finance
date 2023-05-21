import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/styles/stg_router.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_button.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_size.dart';
import 'package:flutter/cupertino.dart';

class TopBarLogged extends TopBar {
  TopBarLogged({Key? key}) : super(key: key, size: TopBarSize(70.0), style: CurrencyStyle.description);

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
      size: ShapeSize.fullWidth(heightRectangle: size.height, context: context),
      gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TopBarButton(
            onPressed: () {
              pushRoute(context, STGRouter.homeRoute);
            },
            text: "home",
          ),
          TopBarButton(
            onPressed: () {
              pushRoute(context, STGRouter.homeRoute);
            },
            text: "log out",
          ),
          TopBarButton(
            onPressed: () {
              pushRoute(context, STGRouter.contributeRoute);
            },
            text: "crypto service",
          ),
          TopBarButton(
            onPressed: () {
              pushRoute(context, STGRouter.userRoute);
            },
            text: "account",
          )
        ],
      ),
    );
  }
}

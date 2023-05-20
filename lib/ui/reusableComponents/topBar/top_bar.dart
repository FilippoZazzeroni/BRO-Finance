import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/ui/shared/stg_router.dart';
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_button.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:flutter/cupertino.dart';
import '../coin.dart';

class TopBar extends StatelessWidget with Navigatable {
  //MARK: init

  const TopBar(
      {Key? key,
      this.title = "BRO FINANCE",
      required this.style,
      required this.size})
      : super(key: key);

  //MARK: properties

  final String title;

  final TopBarSize size;

  final TextStyle style;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
      radius: 20.0,
      size: ShapeSize.fullWidth(heightRectangle: size.height, context: context),
      gradient:
          SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              TopBarButton(
                text: "home",
                onPressed: () {
                  pushRoute(context, STGRouter.homeRoute);
                },
              ),
              TopBarButton(
                text: "use cases",
                onPressed: () {
                  pushRoute(context, STGRouter.contributeRoute);
                },
              ),
              TopBarButton(
                text: "crypto note service",
                onPressed: () {
                  pushRoute(context, STGRouter.contributeRoute);
                },
              ),
              TopBarButton(
                text: "log in",
                onPressed: () {
                  pushRoute(context, STGRouter.authRoute);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title,
                style: style,
              ),
              const SizedBox(
                width: 30.0,
              ),
              Coin(radius: size.height / 1.5),
              const SizedBox(
                width: 30.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

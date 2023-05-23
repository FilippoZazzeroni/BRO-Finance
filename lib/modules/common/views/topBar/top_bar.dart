import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/stg_router.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_size.dart';
import 'package:flutter/cupertino.dart';
import '../coin.dart';
import 'top_bar_button.dart';

class TopBar extends StatelessWidget with Navigatable {
  //MARK: init

  const TopBar({Key? key, this.title = "BRO FINANCE", required this.style, required this.size}) : super(key: key);

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
      gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
      child: Column(
        children: [
          const SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                TopBarButton(
                  text: "home",
                  onPressed: () {
                    pushRouteAndRemoveCurrentInStack(context, STGRouter.homeRoute);
                  },
                ),
                TopBarButton(
                  text: "use cases",
                  onPressed: () {
                    pushRouteAndRemoveCurrentInStack(context, STGRouter.cryptoServiceRoute);
                  },
                ),
                TopBarButton(
                  text: "crypto note service",
                  onPressed: () {
                    pushRouteAndRemoveCurrentInStack(context, STGRouter.cryptoServiceRoute);
                  },
                ),
                TopBarButton(
                  text: "log in",
                  onPressed: () {
                    pushRouteAndRemoveCurrentInStack(context, STGRouter.authRoute);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FittedBox(
                child: Text(
                  title,
                  style: style,
                ),
              ),
              const SizedBox(
                width: 30.0,
              ),
              Flexible(
                child: Coin(radius: size.height / 1.5),
              ),
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

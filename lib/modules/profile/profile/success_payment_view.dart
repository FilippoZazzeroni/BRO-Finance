import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/styles/stg_router.dart';
import 'package:brofinance/modules/common/views/coin.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/common/views/shapes/vertical_space.dart';
import 'package:flutter/material.dart';

class SuccessPaymentView extends StatelessWidget with Navigatable {
  //MARK: init

  const SuccessPaymentView({Key? key}) : super(key: key);

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectangleWithGradient(
        size: ShapeSize.fullScreen(context),
        gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Coin(radius: 120.0),
            VerticalSpace(20.0),
            Text(
              "The payment was successful",
              style: CurrencyStyle.title,
            ),
            Text(
              "Thank you for your contribution, now you are part of bro finance",
              style: CurrencyStyle.description,
            ),
            VerticalSpace(20.0),
            TextButton(
                onPressed: () async {
                  pushRouteAndRemoveCurrentInStack(context, STGRouter.userRoute);
                },
                child: Text(
                  "go to account",
                  style: CurrencyStyle.getDescriptionFrom(SColors.blueDark),
                ))
          ],
        ),
      ),
    );
  }
}

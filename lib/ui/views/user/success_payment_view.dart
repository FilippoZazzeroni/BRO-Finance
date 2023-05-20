import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/models/shared_preferences_helper.dart';
import 'package:brofinance/ui/shared/stg_router.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/shapes/vertical_space.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
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
        gradient:
            SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
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
                  final amountPayed = await SharedPreferencesHelper.getValue(
                      "userPaymentAmount");
                  pushRouteAndRemoveCurrentInStack(
                      context, STGRouter.userRoute);
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

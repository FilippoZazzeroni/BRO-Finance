import 'dart:html';
import 'dart:io';

import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/managers/data_provider.dart';
import 'package:brofinance/models/binance/binance_api.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/shapes/vertical_space.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_logged.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:brofinance/ui/views/user/left_page_content.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  //MARK: init

  const UserView({Key? key}) : super(key: key);

  //MARK: properties

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectangleWithGradient(
        size: ShapeSize.fullScreen(context),
        gradient: SColors.getGradient(SColors.blueDark, SColors.primaryColor, begin: Alignment.topLeft, end: Alignment.bottomRight),
        child: Column(
          children: [
            TopBarLogged(),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  const LeftSidePage(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 50.0,
                      ),
                      Coin(radius: MediaQuery.of(context).size.height / 3),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        "Filippo Zazzeroni",
                        style: CurrencyStyle.description,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                          "Current equity value is ${Auth.shared.user!.equityInPercentage} %",
                          style: CurrencyStyle.getDescriptionFrom(
                              Colors.greenAccent),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}

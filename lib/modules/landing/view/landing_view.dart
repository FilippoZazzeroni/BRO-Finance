import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';
import 'package:brofinance/modules/common/views/coin.dart';
import 'package:brofinance/modules/common/views/shapes/circle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_logged.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_size.dart';
import 'package:brofinance/modules/landing/landing_view_controller.dart';
import 'package:brofinance/modules/landing/view/card.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  //MARK: init

  const LandingView({Key? key, required this.viewController}) : super(key: key);

  //MARK: properties

  final LandingViewController viewController;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: -MediaQuery.of(context).size.width / 1.4,
              left: -MediaQuery.of(context).size.width / 2,
              child: CircleWithGradient(
                  radius: MediaQuery.of(context).size.width,
                  gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor))),
          ListView(
            children: [
              SizedBox(
                height: ShapeSize.fullScreen(context).height,
                width: ShapeSize.fullScreen(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30.0,
                    ),
                    Coin(radius: MediaQuery.of(context).size.height / 2),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "STG",
                      style: CurrencyStyle.getTitleFrom(Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const CardSubView(title: "STG", description: "STG description"),
              const SizedBox(
                height: 30,
              ),
              const CardSubView(title: "Use Cases", description: "STG description"),
            ],
          ),
          StreamBuilder<ViewModel>(
              stream: viewController.eventsStream.stream,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return (snapshot.data?.model as bool)
                      ? TopBarLogged()
                      : TopBar(style: CurrencyStyle.title, size: TopBarSize.standard());
                } else {
                  return viewController.isUserLoggedIn()
                      ? TopBarLogged()
                      : TopBar(style: CurrencyStyle.title, size: TopBarSize.standard());
                }
              }))
        ],
      ),
    );
  }
}

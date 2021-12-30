
import 'package:brofinance/managers/data_provider.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/reusableComponents/shapes/circle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {

  //MARK: init

  const LandingView({Key? key, required this.topBar}) : super(key: key);

  //MARK: properties

  final TopBar topBar;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    DataProvider.shared;
    DataProvider.shared.context = context;

    return Scaffold(
      body: Stack(
        children: [

          Positioned(
              bottom: - MediaQuery.of(context).size.width / 1.4,
              left: - MediaQuery.of(context).size.width / 2,
              child: CircleWithGradient(radius: MediaQuery.of(context).size.width , gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor))),

          ListView(
            children:  [
              SizedBox(
                height: ShapeSize.fullScreen(context).height,
                width: ShapeSize.fullScreen(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30.0,),
                    Coin(radius: MediaQuery.of(context).size.height / 2),
                    const SizedBox(height: 30.0,),
                    Text("STG", style: CurrencyStyle.getTitleFrom(Colors.black), textAlign: TextAlign.center,),
                  ],
                ),
              ),

              const _CardSubView(title: "STG", description: "STG description"),
              const SizedBox(height: 30,),
              const _CardSubView(title: "Use Cases", description: "STG description"),
            ],
          ),

          topBar
        ],
      ),
    );
  }
}


class _CardSubView extends StatelessWidget {

  //MARK: init

  const _CardSubView({Key? key, required this.title, required this.description}) : super(key: key);

  final String description;

  final String title;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return RectangleWithGradient(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: CurrencyStyle.title,),
            Text(description, style: CurrencyStyle.description,)
          ],
        ),
        size: ShapeSize.fullScreen(context), gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor));
  }
}


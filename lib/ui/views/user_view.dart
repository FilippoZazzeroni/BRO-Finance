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
                  FutureBuilder(
                      future: _getBinanceData(context),
                      initialData: Column(
                        children: [
                          VerticalSpace(20.0),
                          const Coin(
                            radius: 50.0,
                          ),
                        ],
                      ),
                      builder: (context, data) {
                        return data.data! as Widget;
                      }),
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
                          "Current equity value is ${Auth.shared.user!.equityInDollars} \$",
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

  Future<Widget> _getBinanceData(BuildContext context) async {
    List<Widget> children = [];
    List<Widget> firstCol = [];
    List<Widget> secondCol = [];
    List<Widget> thirdCol = [];

    await BinanceApi().getAllCurrentTrade();

    for (final element in DataProvider.shared.currentTradeAccount) {
      firstCol.add(Column(
        children: [
          VerticalSpace(45.0),
          Text(
            element.price.toStringAsFixed(3),
            style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),
          ),
        ],
      ),);
      secondCol.add(Column(
        children: [
          VerticalSpace(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Coin(
                radius: 65.0,
                asset:
                "assets/images/${element.symbol.currency1.toLowerCase()}.png",
              ),
              Text(
                "  /  ",
                style: CurrencyStyle.description,
              ),
              Coin(
                radius: 65.0,
                asset:
                "assets/images/${element.symbol.currency2.toLowerCase()}.png",
              ),
            ],
          ),
        ],
      ));
      thirdCol.add(Column(
        children: [
          VerticalSpace(45.0),
          Text(
            "${element.getAmountInDollarsOfTrade(Auth.shared.user!).toStringAsFixed(2)} \$",
            style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),
          ),
        ],
      ));
    }

    children.add(
      Column(
        children: [
          Text("Wallet in percentage of the equity value", style: CurrencyStyle.description, textAlign: TextAlign.center,),
          VerticalSpace(20.0)
        ],
      )
    );
    
    children.add(
      SizedBox(
        height: ShapeSize.fullScreen(context).height,
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            children: [

              Column(
                children: [
                  Text("Currency value", style: CurrencyStyle.description,), ...firstCol,
                ],
              ),

              Column(
                children: [
                  Text("Currency symbols", style: CurrencyStyle.description,), ...secondCol,
                ],
              ),
              Column(
                children: [
                  Text("owned", style: CurrencyStyle.description,), ...thirdCol,
                ],
              )

          ],
        ),
      )
    );
    


    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ListView(
        children: children,
      ),
    );
  }
}

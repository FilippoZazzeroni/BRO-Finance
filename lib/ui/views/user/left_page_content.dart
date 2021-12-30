import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/managers/data_provider.dart';
import 'package:brofinance/models/binance/binance_api.dart';
import 'package:brofinance/models/binance/trade.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/reusableComponents/shapes/vertical_space.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:flutter/material.dart';

class LeftSidePage extends StatelessWidget {
  //MARK: init

  const LeftSidePage({Key? key}) : super(key: key);

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text("Wallet in percentage of the equity value",
          style: CurrencyStyle.description, textAlign: TextAlign.center,),
        VerticalSpace(20.0),


        FutureBuilder(
            future: _constructBodyWithBinanceData(context),
            initialData: Column(
              children: [
                VerticalSpace(20.0),
                const Coin(radius: 60.0, asset: "assets/images/avax.png",)
              ],
            ),
            builder: (context, data) {
              return data.data! as Widget;
            }),

        _buildTotalAmountCell()
      ],
    );
  }

  Future<Widget> _constructBodyWithBinanceData(BuildContext context) async {
    List<Widget> children = [];
    List<Widget> firstCol = [];
    List<Widget> secondCol = [];
    List<Widget> thirdCol = [];

    await BinanceApi().getAllCurrentTrade();

    for (final element in DataProvider.shared.currentTradeAccount) {
      firstCol.add(_buildTextCell(element.price.toStringAsFixed(2)));
      secondCol.add(_buildCoinsCell(element));
      thirdCol.add(_buildTextCell(
          "${element.getAmountInDollarsOfTrade(Auth.shared.user!)
              .toStringAsFixed(2)} \$"));
    }

    children.add(
        SizedBox(
          height: thirdCol.length * 110,
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, mainAxisExtent: thirdCol.length * 110),
            children: [

              Column(
                children: [
                  _buildTextCell("Currency value"),
                  ...firstCol
                ],
              ),

              Column(
                children: [
                  _buildTextCell("Currency symbols"),
                  ...secondCol,
                ],
              ),
              Column(
                children: [
                  _buildTextCell("owned"),
                  ...thirdCol,
                ],
              )

            ],
          ),
        )
    );


    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
                  children: children,
                ),
            )
    );
  }

  Widget _buildTotalAmountCell() {
    double totOwnedAmount = 0.0;

    for (final trade in DataProvider.shared.currentTradeAccount) {
      totOwnedAmount += trade.getAmountInDollarsOfTrade(Auth.shared.user!);
    }

    return
      Column(
        children: [
          VerticalSpace(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total owned amount : ", style: CurrencyStyle.description,),
              Text("${totOwnedAmount.toStringAsFixed(4)} \$",
                style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),)
            ],
          ),
        ],
      );
  }

  Widget _buildTextCell(String text) {
    return Column(
      children: [
        VerticalSpace(68.0),
        Text(
          text,
          style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),
        ),
      ],
    );
  }

  Widget _buildCoinsCell(Trade element) {
    return Column(
      children: [
        VerticalSpace(50.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Coin(
              radius: 55.0,
              asset:
              "assets/images/${element.symbol.currency1.toLowerCase()}.png",
            ),
            Text(
              "  /  ",
              style: CurrencyStyle.description,
            ),
            Coin(
              radius: 55.0,
              asset:
              "assets/images/${element.symbol.currency2.toLowerCase()}.png",
            ),
          ],
        ),
      ],
    );
  }
}

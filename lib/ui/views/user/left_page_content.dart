import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/managers/data_provider.dart';
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
        VerticalSpace(20.0),
        Text(
          "Wallet in percentage of the equity value",
          style: CurrencyStyle.description,
          textAlign: TextAlign.center,
        ),
        FutureBuilder(
            future: _constructBodyWithBinanceData(context),
            initialData: Column(
              children: [
                VerticalSpace(20.0),
                const Coin(
                  radius: 60.0,
                  asset: "assets/images/avax.png",
                )
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
    final bodyOfBinanceData = await _getBodyOfBinanceData();

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: bodyOfBinanceData,
      ),
    ));
  }

  Future<List<Widget>> _getBodyOfBinanceData() async {
    final gridChildren = await _getGridColumnWidgets();
    List<Widget> children = [];
    children.add(SizedBox(
      height: gridChildren[0].length * 115,
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisExtent: gridChildren[0].length * 115),
        children: [
          Column(
            children: [_buildTextCell("Currency value"), ...gridChildren[0]],
          ),
          Column(
            children: [
              _buildTextCell("Currency symbols"),
              ...gridChildren[1],
            ],
          ),
          Column(
            children: [
              _buildTextCell("owned"),
              ...gridChildren[2],
            ],
          )
        ],
      ),
    ));
    return children;
  }

  Future<List<List<Widget>>> _getGridColumnWidgets() async {
    List<Widget> firstCol = [];
    List<Widget> secondCol = [];
    List<Widget> thirdCol = [];

    for (final element in DataProvider.shared.currentTradeAccount) {
      firstCol.add(_buildTextCell(element.price.toStringAsFixed(2)));
      secondCol.add(_buildCoinsCell(element));
      thirdCol.add(_buildTextCell(
          "${element.getAmountInDollarsOfTrade(Auth.shared.user!).toStringAsFixed(2)} \$"));
    }
    return [firstCol, secondCol, thirdCol];
  }

  Widget _buildTotalAmountCell() {
    double totOwnedAmount = 0.0;

    for (final trade in DataProvider.shared.currentTradeAccount) {
      totOwnedAmount += trade.getAmountInDollarsOfTrade(Auth.shared.user!);
    }

    return Column(
      children: [
        VerticalSpace(20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total owned amount : ",
              style: CurrencyStyle.description,
            ),
            Text(
              "${totOwnedAmount.toStringAsFixed(4)} \$",
              style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),
            )
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

import 'package:brofinance/models/binance/trade_symbol.dart';
import 'package:brofinance/models/user_stg.dart';

import 'order.dart';

class Trade {
  //MARK: init
  Trade.fromMap(Map<String, dynamic> data)
      : price = double.parse(data["price"]),
        symbol = data["symbol"],
        order = data["order"];

  //MARK: properties
  final double price;

  final Order order;

  final TradeSymbol symbol;

  //MARK: methods

  double getAmountInDollarsOfTrade(STGUser user) {
    return user.equityInPercentage * order.numberOfCoins * price;
  }
}

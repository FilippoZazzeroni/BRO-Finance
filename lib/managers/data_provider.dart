import 'dart:convert';
import 'package:brofinance/models/binance/binance_api.dart';
import 'package:brofinance/models/binance/order.dart';
import 'package:brofinance/models/binance/trade.dart';
import 'package:brofinance/models/binance/trade_symbol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DataProvider {
  //MARK: init

  DataProvider._private();

  //MARK: properties

  late BuildContext context;

  List<Trade> currentTradeAccount = [];

  List<TradeSymbol> currentTradeSymbols = [];

  List<Order> orders = [];

  static final shared = DataProvider._private();

  //MARK: methods

  void initialize() {
    _getCurrentTradesSymbol();
  }

  void _getCurrentTradesSymbol() async {
    currentTradeAccount.clear();
    orders.clear();
    currentTradeSymbols.clear();

    final jsonString = await rootBundle.loadString("files/trade_assets.json");
    final json = jsonDecode(jsonString) as List;
    for (var element in json) {
      currentTradeSymbols.add(TradeSymbol(element["symbol"],
          currency1: element["currency1"], currency2: element["currency2"]));
      orders.add(Order(element["order"]));
    }

    await BinanceApi().getAllCurrentTrade();
  }
}

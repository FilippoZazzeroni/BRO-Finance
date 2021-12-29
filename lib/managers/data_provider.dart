


import 'dart:convert';
import 'package:brofinance/models/binance/order.dart';
import 'package:brofinance/models/binance/trade.dart';
import 'package:brofinance/models/binance/trade_symbol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class DataProvider {

  //MARK: init

  DataProvider._private() {
    _getCurrentTradesSymbol().then((value) => currentTradeSymbols = value);
  }

  //MARK: properties

  late BuildContext context;

  List<Trade> currentTradeAccount = [];

  List<TradeSymbol> currentTradeSymbols = [];

  List<Order> orders = [];

  static final shared = DataProvider._private();

  //MARK: methods

  Future<List<TradeSymbol>> _getCurrentTradesSymbol() async {
    currentTradeAccount.clear();
    orders.clear();
    currentTradeSymbols.clear();
    List<TradeSymbol> values = [];
    final jsonString = await rootBundle.loadString("files/trade_assets.json");
    print(jsonString);
    final json = jsonDecode(jsonString) as List;
    for (var element in json) {
      values.add(TradeSymbol(element["symbol"], currency1: element["currency1"], currency2: element["currency2"]));
      orders.add(Order(element["order"]));
    }
    return values;
  }

}
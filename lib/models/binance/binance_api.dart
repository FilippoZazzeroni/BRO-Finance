

import 'dart:convert';
import 'package:brofinance/managers/data_provider.dart';
import 'package:brofinance/models/binance/trade.dart';
import 'package:brofinance/models/binance/trade_symbol.dart';
import 'package:http/http.dart';
import 'order.dart';

class BinanceApi {
  
  
  Future _getTradePrice(TradeSymbol trade, Order order) async {

    final response = await get(Uri.parse("https://api.binance.com/api/v3/trades?symbol=${trade.symbol}"));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      json[0]["symbol"] = trade;
      json[0]["order"] = order;
      json[0]["currency1"] = trade.currency1;
      json[0]["currency2"] = trade.currency2;

      final trad = Trade.fromMap(json[0]);
      DataProvider.shared.currentTradeAccount.add(trad);
    }
  }

  Future getAllCurrentTrade() async {
    DataProvider.shared.currentTradeAccount.clear();
    for (var index = 0; index < DataProvider.shared.orders.length; index++) {
      final order = DataProvider.shared.orders[index];
      final symbol = DataProvider.shared.currentTradeSymbols[index];
      await _getTradePrice(symbol, order);
    }
  }
  
}
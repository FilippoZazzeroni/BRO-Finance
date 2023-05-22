import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_size.dart';
import 'package:flutter/material.dart';

class CryptoServiceView extends StatelessWidget {
  const CryptoServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [TopBar(style: CurrencyStyle.title, size: TopBarSize.standard())],
      ),
    );
  }
}

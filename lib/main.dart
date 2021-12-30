import 'package:brofinance/ui/reusableComponents/topBar/top_bar.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_logged.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:flutter/material.dart';

import 'managers/auth/auth.dart';

void main() async {
  await Auth.shared.initialize();
  runApp(MaterialApp(home: LandingView(topBar: Auth.shared.user == null ? TopBar(style: CurrencyStyle.title, size: TopBarSize.standard()) : TopBarLogged())));
}


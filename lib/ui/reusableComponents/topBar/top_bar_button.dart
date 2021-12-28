import 'package:brofinance/mixins/global_context.dart';
import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:brofinance/ui/views/auth_view.dart';
import 'package:brofinance/ui/views/crypto_service_view.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:brofinance/ui/views/use_cases_view.dart';
import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget with Navigatable, GlobalContext {

  //MARK: init

  TopBarButton({Key? key ,required this.onPressed, required this.text}) : super(key: key);

  //MARK: properties

  Function onPressed;

  final String text;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(text, style: CurrencyStyle.description,));
  }

  void pushPageRoute(Widget page) => pushRoute(globalContext, page);
}


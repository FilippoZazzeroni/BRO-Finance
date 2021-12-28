import 'package:brofinance/mixins/global_context.dart';
import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/ui/views/auth_view.dart';
import 'package:brofinance/ui/views/crypto_service_view.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:brofinance/ui/views/use_cases_view.dart';
import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget with Navigatable, GlobalContext {

  //MARK: init

  TopBarButton({Key? key ,required this.onPressed, required this.text}) : super(key: key);

  TopBarButton.logIn({Key? key})
    : text = "log in", super(key: key) {
    onPressed = () {
      pushPageRoute(const AuthView());
    };
  }

  TopBarButton.home({Key? key})
    : text = "home", super(key: key) {

    onPressed = () {
      pushPageRoute(const LandingView());
    };
  }

  TopBarButton.useCases({Key? key})
      : text = "use cases", super(key: key) {

    onPressed = () {
      pushPageRoute(const UseCasesView());
    };
  }

  TopBarButton.cryptoService({Key? key})
      : text = "crypto note service", super(key: key) {

    onPressed = () {
      pushPageRoute(const CryptoServiceView());
    };
  }


  //MARK: properties

  Function? onPressed;

  final String text;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed!();
        },
        child: Text(text));
  }

  void pushPageRoute(Widget page) => pushRoute(globalContext, page);
}


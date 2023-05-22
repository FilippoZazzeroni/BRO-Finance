import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:flutter/material.dart';

class TopBarButton extends StatelessWidget with Navigatable {
  //MARK: init

  TopBarButton({Key? key, required this.onPressed, required this.text}) : super(key: key);

  //MARK: properties

  final Function onPressed;

  final String text;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: FittedBox(
          child: Text(
            text,
            style: CurrencyStyle.description,
          ),
        ));
  }
}

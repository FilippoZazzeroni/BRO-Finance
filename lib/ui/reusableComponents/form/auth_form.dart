import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  //MARK: init

  const AuthForm({Key? key, required this.onChanged, required this.hint})
      : super(key: key);

  //MARK: properties

  final String hint;

  final Function(String) onChanged;

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onFieldSubmitted: onChanged,
      style: CurrencyStyle.getDescriptionFrom(Colors.white, blurRadius: 1),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: CurrencyStyle.getDescriptionFrom(Colors.white70, blurRadius: 1),
      ),
    );
  }
}

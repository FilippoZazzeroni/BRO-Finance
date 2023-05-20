import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/views/user/contribute_dialog.dart';
import 'package:brofinance/ui/reusableComponents/shapes/vertical_space.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:flutter/material.dart';

class RightPageContent extends StatelessWidget {
  //MARK: init

  const RightPageContent({Key? key}) : super(key: key);

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 50.0,
        ),
        Coin(radius: MediaQuery.of(context).size.height / 3),
        const SizedBox(
          height: 30.0,
        ),
        Text(
          "Filippo Zazzeroni",
          style: CurrencyStyle.description,
          textAlign: TextAlign.center,
        ),
        Text(
            "Current equity value is ${Auth.shared.user!.equityInPercentage * 100} %",
            style: CurrencyStyle.getDescriptionFrom(Colors.greenAccent),
            textAlign: TextAlign.center),
        VerticalSpace(20.0),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: SColors.blueDark),
          child: TextButton(
              onPressed: () {
                STGDialog().showSTGDialog(context);
              },
              child: Text("Contribute to BRO Finance",
                  style: CurrencyStyle.description)),
        )
      ],
    );
  }
}

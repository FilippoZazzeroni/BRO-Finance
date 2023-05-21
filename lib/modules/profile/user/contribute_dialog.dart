import 'package:brofinance/models/stripe_connect.dart';
import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/views/coin.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:flutter/material.dart';

class STGDialog {
  String _formValue = "";

  void showSTGDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.transparent,
            content: RectangleWithGradient(
                gradient: SColors.getGradient(
                    SColors.primaryColor, SColors.secondaryColor),
                size: ShapeSize(height: 400, width: 400),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "contribute to bro finance",
                          style: CurrencyStyle.description,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Insert the amount you want to invest in BRO finance",
                          style: CurrencyStyle.getDescriptionFrom(Colors.white,
                              textSize: 18.0),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    onChanged: (value) {
                                      _formValue = value;
                                    },
                                    style: CurrencyStyle.description,
                                    decoration: InputDecoration(
                                        prefix: Text(
                                          "\$",
                                          style: CurrencyStyle.description,
                                        ),
                                        hintText: " Insert amount",
                                        hintStyle:
                                            CurrencyStyle.getDescriptionFrom(
                                                Colors.white70,
                                                textSize: 20)),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                const Coin(
                                  radius: 60.0,
                                  asset: "assets/images/usdt.png",
                                )
                              ],
                            ),
                          ),
                        ),
                        Text(
                            "By submitting the form you sign the SAFT agreement that will be available in your account page under document section",
                            textAlign: TextAlign.center,
                            style: CurrencyStyle.getDescriptionFrom(
                                Colors.white,
                                textSize: 18.0)),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Review SAFT here",
                            style: CurrencyStyle.getDescriptionFrom(
                                Colors.redAccent,
                                textSize: 18.0),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              redirectToCheckout(int.parse(_formValue));
                            },
                            child: Text(
                              "Contribute",
                              style: CurrencyStyle.description,
                            ))
                      ]),
                )),
          );
        });
  }
}

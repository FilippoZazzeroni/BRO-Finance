import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';
import 'package:brofinance/modules/common/views/coin.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/profile/authentication/auth_view_controller.dart';
import 'package:flutter/material.dart';
import 'auth_form.dart';

class AuthView extends StatelessWidget with Navigatable {
  AuthView({Key? key, required this.viewController}) : super(key: key);

  //MARK: properties
  String _email = "";

  String _password = "";

  final AuthViewController viewController;

  //MARK: methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectangleWithGradient(
        size: ShapeSize.fullScreen(context),
        gradient: SColors.getGradient(SColors.redDark, SColors.blueDark),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Coin(
              radius: MediaQuery.of(context).size.height / 4,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: AuthForm(
                hint: "email",
                onChanged: (email) {
                  _email = email;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: AuthForm(
                hint: "password",
                onChanged: (pwd) {
                  _password = pwd;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<ViewModel>(
                stream: viewController.eventsStream.stream,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            viewController.signIn(email: _email, password: _password);
                          },
                          child: snapshot.data?.isLoading ?? false
                              ? const Coin(
                                  radius: 50.0,
                                )
                              : Text(
                                  "Sign in",
                                  style: CurrencyStyle.description,
                                )),
                      TextButton(
                          onPressed: () {
                            viewController.signUp(email: _email, password: _password);
                          },
                          child: Text(
                            "Sign up",
                            style: CurrencyStyle.description,
                          )),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}

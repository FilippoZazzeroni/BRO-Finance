import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/managers/auth/auth_exception.dart';
import 'package:brofinance/mixins/loadable.dart';
import 'package:brofinance/mixins/navigatable.dart';
import 'package:brofinance/ui/reusableComponents/coin.dart';
import 'package:brofinance/ui/reusableComponents/form/auth_form.dart';
import 'package:brofinance/ui/reusableComponents/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/ui/reusableComponents/shapes/shape_size.dart';
import 'package:brofinance/ui/shared/colors/website_colors.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'user_view.dart';

class AuthView extends StatefulWidget  {

  //MARK: init

  AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> with Navigatable, Loadable {
  //MARK: properties
  String _email = "";

  String _password = "";

  //MARK: methods
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectangleWithGradient(
        size: ShapeSize.fullScreen(context),
        gradient: SColors.getGradient(SColors.primaryColor, SColors.secondaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Coin(radius: MediaQuery.of(context).size.height / 4,),
            const SizedBox(height: 40.0,),
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
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () async {

                      try {
                        setStateOfLoading(setState);
                        await Auth.shared.signInWithEmailPassword(_email, _password);
                        setStateOfLoading(setState);
                        pushRoute(context, const UserView());
                      } on AuthException catch (e) {
                        Fluttertoast.showToast(msg: e.message, timeInSecForIosWeb: 2);
                        setStateOfLoading(setState);
                      }
                    },
                    child: isLoading ? const Coin(radius: 50.0,) : Text("Sign in", style: CurrencyStyle.description,)),
                TextButton(
                    onPressed: () async {
                      setStateOfLoading(setState);
                      await Auth.shared.signUpWithEmailPassword(_email, _password);
                      setStateOfLoading(setState);
                      Fluttertoast.showToast(msg: "Verification email sent", timeInSecForIosWeb: 2);
                    },
                    child: Text("Sign up", style: CurrencyStyle.description,)),
              ],
            )

          ],
        ),
      ),
    );
  }
}

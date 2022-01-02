
import 'package:brofinance/managers/auth/auth.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_logged.dart';
import 'package:brofinance/ui/reusableComponents/topBar/top_bar_size.dart';
import 'package:brofinance/ui/shared/currency_text_style.dart';
import 'package:brofinance/ui/views/auth_view.dart';
import 'package:brofinance/ui/views/crypto_service_view.dart';
import 'package:brofinance/ui/views/landing_view.dart';
import 'package:brofinance/ui/views/user/success_payment_view.dart';
import 'package:brofinance/ui/views/user/user_view.dart';

class STGRouter {

  static const homeRoute = "/";

  static const authRoute = "/auth";

  static const userRoute = "/user";

  static const contributeRoute = "/contribute";

  static const userSuccessPaymentsRoute = "/user-success";

  static final routes = {
    homeRoute: (context) => LandingView(topBar: Auth.shared.user == null ? TopBar(style: CurrencyStyle.description, size: TopBarSize.standard(),) : TopBarLogged()),
    authRoute: (context) => const AuthView(),
    userRoute: (context) => const UserView(),
    contributeRoute: (context) => const CryptoServiceView(),
    userSuccessPaymentsRoute: (context) => const SuccessPaymentView()
  };

}
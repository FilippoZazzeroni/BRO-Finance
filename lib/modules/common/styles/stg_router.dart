import 'package:brofinance/modules/common/styles/currency_text_style.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_size.dart';
import 'package:brofinance/modules/profile/authentication/auth_view.dart';
import 'package:brofinance/modules/crypto%20notes/crypto_service_view.dart';
import 'package:brofinance/modules/landing/landing_view.dart';
import 'package:brofinance/modules/profile/user/success_payment_view.dart';
import 'package:brofinance/modules/profile/user/user_view.dart';

class STGRouter {
  static const homeRoute = "/";

  static const authRoute = "/auth";

  static const userRoute = "/user";

  static const contributeRoute = "/contribute";

  static const userSuccessPaymentsRoute = "/user-success";

  static final routes = {
    homeRoute: (context) => LandingView(
          topBar: TopBar(style: CurrencyStyle.title, size: TopBarSize.standard()),
        ),
    authRoute: (context) => const AuthView(),
    userRoute: (context) => const UserView(),
    contributeRoute: (context) => const CryptoServiceView(),
    userSuccessPaymentsRoute: (context) => const SuccessPaymentView()
  };
}

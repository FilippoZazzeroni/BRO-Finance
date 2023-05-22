import 'package:brofinance/modules/common/models/networking/standard_api_request.dart';
import 'package:brofinance/modules/crypto%20notes/crypto_service_view.dart';
import 'package:brofinance/modules/landing/landing_view_controller.dart';
import 'package:brofinance/modules/landing/view/landing_view.dart';
import 'package:brofinance/modules/profile/authentication/auth_view_controller.dart';
import 'package:brofinance/modules/profile/authentication/view/auth_view.dart';
import 'package:brofinance/modules/profile/profile/success_payment_view.dart';
import 'package:brofinance/modules/profile/profile/profile_view.dart';

class STGRouter {
  static const homeRoute = "/";

  static const authRoute = "/auth";

  static const userRoute = "/user";

  static const cryptoServiceRoute = "/crypto-service";

  static const userSuccessPaymentsRoute = "/user-success";

  static final routes = {
    homeRoute: (context) => LandingView(viewController: LandingViewController(apiRequest: StandardApiRequest())),
    authRoute: (context) => AuthView(viewController: AuthViewController(apiRequest: StandardApiRequest())),
    userRoute: (context) => const ProfileView(),
    cryptoServiceRoute: (context) => const CryptoServiceView(),
    userSuccessPaymentsRoute: (context) => const SuccessPaymentView()
  };
}

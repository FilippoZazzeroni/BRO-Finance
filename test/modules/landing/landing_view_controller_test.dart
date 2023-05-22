import 'package:brofinance/modules/common/models/notification/notification_center.dart';
import 'package:brofinance/modules/common/models/notification/notifications.dart';
import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';
import 'package:brofinance/modules/landing/landing_view_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/networking/mock_standard_api.dart';

void main() {
  group("Landing view controller tests", () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({"isLogged": true});
      SyncSharedPreferences.instance = await SharedPreferences.getInstance();
    });

    test("Auth notification arrives correctly", () {
      final viewController = LandingViewController(apiRequest: MockSuccessStandardApi());

      expectLater(viewController.eventsStream.stream, emits(const ViewModel<bool>(model: true)));

      NotificationCenter.shared.post(notificationName: Notifications.authViewDidLogin);
    });

    test("Parameter isLogged in shared preferences evaluates to true", () {
      final viewController = LandingViewController(apiRequest: MockSuccessStandardApi());

      expect(viewController.isUserLoggedIn(), true);
    });
  });
}

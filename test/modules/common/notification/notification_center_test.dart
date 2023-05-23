import 'package:brofinance/modules/common/models/notification/notification_center.dart';
import 'package:brofinance/modules/common/models/notification/notifications.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Notification center tests", () {
    test("Test callback is called correctly", () {
      NotificationCenter.shared.addObserver(
          object: "test object",
          notificationName: Notifications.authViewDidLogin,
          callback: (data) {
            expect(data != null, true);
            expect(data is bool, true);
            expect(data, true);
          });

      NotificationCenter.shared.post(notificationName: Notifications.authViewDidLogin, data: true);
    });
  });
}

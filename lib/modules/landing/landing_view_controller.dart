import 'package:brofinance/modules/common/models/networking/api_request.dart';
import 'package:brofinance/modules/common/models/notification/notification_center.dart';
import 'package:brofinance/modules/common/models/notification/notifications.dart';
import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/view%20controllers/view_controller.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';

class LandingViewController extends ViewController {
  LandingViewController({required ApiRequest apiRequest}) : super(apiRequest: apiRequest) {
    _registerToLoginUpdate();
  }

  void _registerToLoginUpdate() {
    NotificationCenter.shared.addObserver(
        object: this,
        notificationName: Notifications.authViewDidLogin,
        callback: (data) {
          eventsStream.sink.add(const ViewModel<bool>(model: true));
        });
  }

  bool isUserLoggedIn() => SyncSharedPreferences.instance.getBool("isLogged") ?? false;
}

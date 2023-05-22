import 'package:brofinance/modules/common/models/networking/api_configuration.dart';
import 'package:brofinance/modules/common/models/networking/api_request.dart';
import 'package:brofinance/modules/common/models/networking/end_points.dart';
import 'package:brofinance/modules/common/models/networking/request_type.dart';
import 'package:brofinance/modules/common/models/notification/notification_center.dart';
import 'package:brofinance/modules/common/models/notification/notifications.dart';
import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/models/user/user.dart';
import 'package:brofinance/modules/common/view%20controllers/view_controller.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';

class AuthViewController extends ViewController {
  //MARK: inits

  AuthViewController({required ApiRequest apiRequest}) : super(apiRequest: apiRequest);

  //MARK: properties

  //MARK: methods

  void signIn({required String email, required String password}) async {
    eventsStream.sink.add(const ViewModel(isLoading: true));
    final requestBody = {"email": email, "password": password};
    final response = await apiRequest
        .perform(ApiConfiguration(endPoint: EndPoints.singIn(), type: RequestType.post, body: requestBody));
    if (response.statusCode == 200) {
      //TODO: implement user
      final user = User(email: "", id: 1);
      SyncSharedPreferences.instance.setBool("isLogged", true);
      NotificationCenter.shared.post(notificationName: Notifications.authViewDidLogin);
      eventsStream.sink.add(const ViewModel());
    } else {
      eventsStream.sink.add(ViewModel(error: response.response["response"]));
    }
  }

  void signUp({required String email, required String password}) async {
    eventsStream.sink.add(ViewModel(isLoading: true));
    final requestBody = {"email": email, "password": password};
    final response = await apiRequest
        .perform(ApiConfiguration(endPoint: EndPoints.signUp(), type: RequestType.post, body: requestBody));
    if (response.statusCode == 200) {
      final user = User(email: "", id: 1);
      SyncSharedPreferences.instance.setBool("isLogged", true);
      eventsStream.sink.add(const ViewModel());
    } else {
      eventsStream.sink.add(ViewModel(error: response.response["response"]));
    }
  }
}

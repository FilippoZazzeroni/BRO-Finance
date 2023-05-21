import 'package:brofinance/modules/common/models/networking/api_configuration.dart';
import 'package:brofinance/modules/common/models/networking/api_request.dart';
import 'package:brofinance/modules/common/models/networking/end_points.dart';
import 'package:brofinance/modules/common/models/networking/request_type.dart';
import 'package:brofinance/modules/common/models/user/user.dart';
import 'package:brofinance/modules/common/view_controllers/view_controller.dart';
import 'package:brofinance/modules/common/view_controllers/view_model.dart';

class AuthViewController extends ViewController {
  //MARK: inits

  AuthViewController({required ApiRequest apiRequest}) : super(apiRequest: apiRequest);

  //MARK: properties

  //MARK: methods

  void signIn({required String email, required String password}) async {
    eventsStream.sink.add(ViewModel(isLoading: true));
    final response = await apiRequest.perform(ApiConfiguration(endPoint: EndPoints.singIn(), type: RequestType.post));
    if (response.statusCode == 200) {
      final user = User.fromMap(response.response);
      eventsStream.sink.add(ViewModel<User>(model: user));
    } else {
      eventsStream.sink.add(ViewModel(error: response.response["response"]));
    }
  }

  void signUp({required String email, required String password}) async {
    eventsStream.sink.add(ViewModel(isLoading: true));
    final response = await apiRequest.perform(ApiConfiguration(endPoint: EndPoints.signUp(), type: RequestType.post));
    if (response.statusCode == 200) {
      final user = User.fromMap(response.response);
      eventsStream.sink.add(ViewModel<User>(model: user));
    } else {
      eventsStream.sink.add(ViewModel(error: response.response["response"]));
    }
  }
}

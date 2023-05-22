import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';
import 'package:brofinance/modules/profile/authentication/auth_view_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/networking/mock_standard_api.dart';

void main() {
  group("Test sign functionality", () {
    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      SharedPreferences.setMockInitialValues({});
      SyncSharedPreferences.instance = await SharedPreferences.getInstance();
    });

    test("Verifiy sign in is successfull", () {
      final viewController = AuthViewController(apiRequest: MockSuccessStandardApi());
      const expectedEvents = [ViewModel(isLoading: true), ViewModel()];

      expectLater(viewController.eventsStream.stream, emitsInOrder(expectedEvents));

      viewController.signIn(email: "filippo.zazzeroni@gmail.com", password: "password");
    });

    test("Verifiy sign in is failing", () {
      final viewController = AuthViewController(apiRequest: MockFailingStandardApi());
      const expectedEvents = [ViewModel(isLoading: true), ViewModel(error: "error")];

      expectLater(viewController.eventsStream.stream, emitsInOrder(expectedEvents));

      viewController.signIn(email: "filippo.zazzeroni@gmail.com", password: "password");
    });

    test("Verifiy sign up is successfull", () {
      final viewController = AuthViewController(apiRequest: MockSuccessStandardApi());
      const expectedEvents = [ViewModel(isLoading: true), ViewModel()];

      expectLater(viewController.eventsStream.stream, emitsInOrder(expectedEvents));

      viewController.signUp(email: "filippo.zazzeroni@gmail.com", password: "password");
    });

    test("Verifiy sign up is failing", () {
      final viewController = AuthViewController(apiRequest: MockFailingStandardApi());
      const expectedEvents = [ViewModel(isLoading: true), ViewModel(error: "error")];

      expectLater(viewController.eventsStream.stream, emitsInOrder(expectedEvents));

      viewController.signUp(email: "filippo.zazzeroni@gmail.com", password: "password");
    });
  });
}

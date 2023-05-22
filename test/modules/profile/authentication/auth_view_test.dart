import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/views/coin.dart';
import 'package:brofinance/modules/profile/authentication/auth_view_controller.dart';
import 'package:brofinance/modules/profile/authentication/view/auth_form.dart';
import 'package:brofinance/modules/profile/authentication/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/networking/mock_standard_api.dart';

void main() {
  group("Auth view tests", () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      SyncSharedPreferences.instance = await SharedPreferences.getInstance();
    });

    testWidgets("Test auth view successfully sign in", (tester) async {
      await tester.pumpWidget(
          MaterialApp(home: AuthView(viewController: AuthViewController(apiRequest: MockSuccessStandardApi()))));

      expect(find.byType(AuthForm), findsWidgets);

      await tester.enterText(find.byKey(const Key("email")), "filippo.zazzeroni@gmail.com");
      await tester.enterText(find.byKey(const Key("password")), "password");

      await tester.tap(find.text("Sign in"));
      await tester.pump(const Duration(seconds: 1));

      // There should be two coins one for loading and one as main logo above the auth forms.
      expect(find.byType(Coin), findsWidgets);

      await tester.pump();

      // Once the loading is done there as to be only one coin.
      expect(find.byType(Coin), findsOneWidget);
    });

    testWidgets("Test auth view successfully sign up", (tester) async {
      await tester.pumpWidget(
          MaterialApp(home: AuthView(viewController: AuthViewController(apiRequest: MockSuccessStandardApi()))));

      expect(find.byType(AuthForm), findsWidgets);

      await tester.enterText(find.byKey(const Key("email")), "filippo.zazzeroni@gmail.com");
      await tester.enterText(find.byKey(const Key("password")), "password");

      await tester.tap(find.text("Sign up"));
      await tester.pump(const Duration(seconds: 1));

      // There should be two coins one for loading and one as main logo above the auth forms.
      expect(find.byType(Coin), findsWidgets);

      await tester.pump();

      // Once the loading is done there as to be only one coin.
      expect(find.byType(Coin), findsOneWidget);
    });
  });
}

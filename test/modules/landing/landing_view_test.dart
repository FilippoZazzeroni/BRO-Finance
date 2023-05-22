import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/styles/stg_router.dart';
import 'package:brofinance/modules/crypto%20notes/crypto_service_view.dart';
import 'package:brofinance/modules/landing/view/landing_view.dart';
import 'package:brofinance/modules/profile/authentication/view/auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group("Landing view tests", () {
    testWidgets("Testing route navigation to correctd routes when app is not logged", (tester) async {
      SharedPreferences.setMockInitialValues({});
      SyncSharedPreferences.instance = await SharedPreferences.getInstance();

      await tester.pumpWidget(MaterialApp(routes: STGRouter.routes, initialRoute: STGRouter.homeRoute));

      expect(find.byType(LandingView), findsOneWidget);

      await tester.tap(find.text("crypto note service"));
      await tester.pumpAndSettle();

      expect(find.byType(CryptoServiceView), findsOneWidget);

      await tester.tap(find.text("home"));
      await tester.pumpAndSettle(const Duration(seconds: 1));

      expect(find.byType(LandingView), findsOneWidget);

      await tester.tap(find.text("log in"));
      await tester.pumpAndSettle();

      expect(find.byType(AuthView), findsOneWidget);

      await tester.tap(find.byKey(const Key("coin tap gesture")));
      await tester.pumpAndSettle();

      expect(find.byType(LandingView), findsOneWidget);
    });
  });
}

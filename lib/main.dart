import 'package:brofinance/managers/data_provider.dart';
import 'package:brofinance/ui/shared/stg_router.dart';
import 'package:flutter/material.dart';

import 'managers/auth/auth.dart';

void main() async {
  await Auth.shared.initialize();
  runApp(
      MaterialApp(
          initialRoute: STGRouter.homeRoute,
          routes: STGRouter.routes));
}


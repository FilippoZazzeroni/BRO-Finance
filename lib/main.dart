import 'package:brofinance/ui/views/landing_view.dart';
import 'package:flutter/material.dart';

import 'managers/auth/auth.dart';

void main() {
  Auth.initialize();
  runApp(const MaterialApp(home: LandingView()));
}


import 'package:brofinance/modules/common/models/shared%20preferences/sync_shared_preferences.dart';
import 'package:brofinance/modules/common/styles/stg_router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  SyncSharedPreferences.instance = await SharedPreferences.getInstance();
  runApp(MaterialApp(initialRoute: STGRouter.homeRoute, routes: STGRouter.routes));
}

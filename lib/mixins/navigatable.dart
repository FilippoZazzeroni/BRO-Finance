
import 'package:flutter/material.dart';

mixin Navigatable {

  void pushRoute(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }

  void pushRouteAndRemoveCurrentInStack(BuildContext context, String route) {
    Navigator.of(context).pushReplacementNamed(route);
  }

}
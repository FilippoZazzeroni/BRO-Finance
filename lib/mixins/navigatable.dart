
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin Navigatable {

  void pushRoute(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

}
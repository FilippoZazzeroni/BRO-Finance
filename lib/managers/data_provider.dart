

import 'package:flutter/cupertino.dart';

class DataProvider {

  //MARK: init

  DataProvider._private();

  //MARK: properties

  late BuildContext context;

  static final shared = DataProvider._private();

}
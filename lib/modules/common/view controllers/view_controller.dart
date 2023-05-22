import 'dart:async';
import 'package:brofinance/modules/common/models/networking/api_request.dart';
import 'package:brofinance/modules/common/view%20controllers/view_model.dart';

abstract class ViewController {
  ViewController({required this.apiRequest});

  final ApiRequest apiRequest;

  final StreamController<ViewModel> eventsStream = StreamController.broadcast();
}

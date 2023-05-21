import 'request_type.dart';

class ApiConfiguration {
  ApiConfiguration({required this.endPoint, required this.type, this.body = const {}, this.headers = const {}});

  final String endPoint;
  final RequestType type;
  final Map<String, dynamic> body;
  final Map<String, String> headers;
}

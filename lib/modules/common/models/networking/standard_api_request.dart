import 'dart:convert';
import 'package:brofinance/modules/common/models/networking/api_configuration.dart';
import 'package:brofinance/modules/common/models/networking/api_response.dart';
import 'api_request.dart';
import 'package:http/http.dart';
import 'request_type.dart';

class StandardApiRequest implements ApiRequest {
  @override
  Future<ApiResponse> perform(ApiConfiguration apiConfiguration) async {
    final url = Uri.parse(apiConfiguration.endPoint);
    final request = Client();
    late Response response;
    switch (apiConfiguration.type) {
      case RequestType.get:
        response = await request.get(url, headers: apiConfiguration.headers);
        break;
      case RequestType.post:
        response = await request.post(url, headers: apiConfiguration.headers, body: apiConfiguration.body);
        break;
      case RequestType.put:
        response = await request.put(url, headers: apiConfiguration.headers, body: apiConfiguration.body);
        break;
      case RequestType.delete:
        response = await request.delete(url, headers: apiConfiguration.headers, body: apiConfiguration.body);
        break;
    }
    return ApiResponse(response: jsonDecode(response.body), statusCode: response.statusCode);
  }
}

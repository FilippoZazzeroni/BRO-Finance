import 'package:brofinance/modules/common/models/networking/api_configuration.dart';
import 'package:brofinance/modules/common/models/networking/api_request.dart';
import 'package:brofinance/modules/common/models/networking/api_response.dart';

class MockSuccessStandardApi implements ApiRequest {
  @override
  Future<ApiResponse> perform(ApiConfiguration apiConfiguration) {
    return Future.delayed(const Duration(seconds: 0), () {
      return ApiResponse(response: {"response": "success"}, statusCode: 200);
    });
  }
}

class MockFailingStandardApi implements ApiRequest {
  @override
  Future<ApiResponse> perform(ApiConfiguration apiConfiguration) {
    return Future.delayed(const Duration(seconds: 0), () {
      return ApiResponse(response: {"response": "error"}, statusCode: 400);
    });
  }
}

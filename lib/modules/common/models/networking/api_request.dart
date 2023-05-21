import 'api_configuration.dart';
import 'api_response.dart';

abstract class ApiRequest {
  Future<ApiResponse> perform(ApiConfiguration apiConfiguration);
}

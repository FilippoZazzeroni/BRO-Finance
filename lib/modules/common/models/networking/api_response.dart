class ApiResponse {
  ApiResponse({required this.response, required this.statusCode, this.error});

  final Map<String, dynamic> response;
  final int statusCode;
  final String? error;
}

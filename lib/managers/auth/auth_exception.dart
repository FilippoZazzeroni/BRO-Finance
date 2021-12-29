

class STGAuthException implements Exception {

  //MARK: init

  STGAuthException({required this.code,required this.message});

  //MARK: properties

  final int code;

  final String message;

}
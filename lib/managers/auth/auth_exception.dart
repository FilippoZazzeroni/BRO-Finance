
import 'package:brofinance/managers/auth/auth.dart';

class AuthException implements Exception {

  //MARK: init

  AuthException({required this.code,required this.message});

  //MARK: properties

  final int code;

  final String message;

}
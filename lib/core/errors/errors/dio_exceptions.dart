import 'package:dio/dio.dart';

import 'app_exceptions.dart';

AppExceptions handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return RemoteException(message: "Connection timed out. Please try again.");
    case DioExceptionType.badResponse:
      final statusCode = error.response?.statusCode ?? 'Unknown';
      return RemoteException(
          message: "Server error ($statusCode). Please try later.");
    case DioExceptionType.cancel:
      return RemoteException(message: "Request was cancelled.");
    case DioExceptionType.unknown:
    default:
      return RemoteException(
          message: "Something went wrong. Please check your internet connection.");
  }
}

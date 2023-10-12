import 'package:dio/dio.dart';

class DioErrorUtil {
  static String handleError(DioException exception) {
    String error = "";

    try {
      switch (exception.type) {
        case DioExceptionType.cancel:
          error = "Request to was cancelled";
          break;
        case DioExceptionType.connectionTimeout:
          error = "Connection timeout with server";
          break;
        case DioExceptionType.connectionError:
          error = "Connection to server failed due to internet connection";
          break;
        case DioExceptionType.receiveTimeout:
          error = "Receive timeout in connection with server";
          break;
        case DioExceptionType.sendTimeout:
          error = "Send timeout in connection with server";
          break;
        case DioExceptionType.badResponse:
          error = exception.message ??
              "Oops, someting wrong happen. Try again later";
          break;
        default:
          error = "Oops, someting wrong happen. Try again later";
          break;
      }
    } catch (e) {
      error = "Oops, someting wrong happen. Try again later";
    }

    return error;
  }
}

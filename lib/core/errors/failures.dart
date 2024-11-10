import 'package:dio/dio.dart';

abstract class Failures {
  final String message;

  Failures(this.message);
}

class ServerFailure extends Failures {
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("ConnectingTimout with api server");
      case DioExceptionType.sendTimeout:
        return ServerFailure("SendTimeout with api server");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("ReceiveTimeout with api server");

      case DioExceptionType.badCertificate:
        return ServerFailure("BadCertificate with api server");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure("Cancel with api server");

      case DioExceptionType.connectionError:
        return ServerFailure("No Internet Connection");

      case DioExceptionType.unknown:
        return ServerFailure("Oops there was an error , please try again");
    }
  }
  factory ServerFailure.fromResponse(int statesCode, dynamic respose) {
    if (statesCode == 404) {
      return ServerFailure("your request not found,  please try later");
    } else if (statesCode == 500) {
      return ServerFailure("there was an error with api , please try later");
    } else if (statesCode == 400 || statesCode == 401 || statesCode == 403) {
      return ServerFailure(respose["error"]["message"]);
    } else {
      return ServerFailure("there was an error with api , please try again");
    }
  }
}

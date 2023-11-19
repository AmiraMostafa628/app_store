import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure{
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioError dioError)
  {
    switch(dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure('Connections timeOut with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeOut with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeOut with ApiServer');
      case DioErrorType.response:
        return ServerFailure.fromResponse(dioError.response!.statusCode!, dioError.response!.data!);
      case DioErrorType.cancel:
        return ServerFailure('Request to ApiServer was canceled');
      case DioErrorType.other:
        if(dioError.message.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('unexpected error,,please try again');
      default:
        return ServerFailure('Opps There was an Error,please try again later');

    }

  }

  factory ServerFailure.fromResponse(int statusCode ,dynamic response){
    if(statusCode ==400 || statusCode ==401 ||statusCode ==403 ) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode ==404) {
      return ServerFailure('Your request is not Found,please try again later');
    }else if (statusCode ==500){
      return ServerFailure('Internal Server Error,please try again later');
    }else
    {
      return ServerFailure('Opps There was an Error,please try again later');
    }
  }

}
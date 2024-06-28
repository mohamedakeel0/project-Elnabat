
import 'package:equatable/equatable.dart';
import 'package:final_project/core/utils/app_strings.dart';


class ServerException extends Equatable implements Exception {
  final String message;

  const ServerException(this.message);

  @override
  String toString() {
    return message;
  }

  @override
  List<Object?> get props => [message];
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super(message);
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super(message);
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super(message);
}

class NotFoundException extends ServerException {
  const NotFoundException([message]) : super(message);
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super(message);
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException([message])
      : super(AppStrings.checkInternet);
}

class NoInternetConnectionException extends ServerException {
  NoInternetConnectionException([message])
      : super(AppStrings.checkInternet);
}

class CacheException implements Exception {}

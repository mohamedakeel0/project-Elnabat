import 'dart:io';

import 'package:dio/dio.dart';
import 'package:final_project/core/error/exeptions.dart';
import 'package:final_project/core/utils/app_strings.dart';
import 'package:final_project/core/utils/constants.dart';
import 'package:final_project/core/utils/extensions.dart';
import 'package:final_project/core/utils/status_code.dart';
import 'package:flutter/foundation.dart';

import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

class DioService implements NetworkService {
  late final Dio _dio;

  DioService() {
    _initDio();
  }

  void _initDio() {

    _dio = Dio()
      ..options.baseUrl = AppConstance.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: AppConstance.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: AppConstance.receiveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json
      ..options.headers = {
        HttpHeaders.acceptHeader: ContentType.json,

      };
print(_dio.options.baseUrl);

    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
  }

  void addTokenToRequest(String token) {
    _dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
  }

  void removeTokenFromRequest() {
    _dio.options.headers.remove(HttpHeaders.authorizationHeader);
  }

  @override
  Future<Model> callApi<Model>(NetworkRequest networkRequest,
      {Model Function(dynamic json)? mapper}) async {
    try {
      await networkRequest.prepareRequestData();
      final response = await _dio.request(networkRequest.path,
          data: networkRequest.hasBodyAndProgress()
              ? networkRequest.isFormData
                  ? FormData.fromMap(networkRequest.body!)
                  : networkRequest.body
              : networkRequest.body,
          queryParameters: networkRequest.queryParameters,
          onSendProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onSendProgress
              : null,
          onReceiveProgress: networkRequest.hasBodyAndProgress()
              ? networkRequest.onReceiveProgress
              : null,
          options: Options(
              method: networkRequest.asString(),
              headers: networkRequest.headers));
      if (mapper != null) {
        return mapper(response.data);
      } else {
        return response.data;
      }
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        throw SocketException(AppStrings.checkInternet);
      case DioExceptionType.sendTimeout:
        throw SocketException(AppStrings.checkInternet);
      case DioExceptionType.receiveTimeout:
        throw SocketException(AppStrings.checkInternet);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case StatusCode.badRequest:
            throw BadRequestException(
              error.response?.data['message'] ?? AppStrings.badRequest,
            );
          case StatusCode.unauthorized:
            throw UnauthorizedException(
              error.response?.data['message'] ?? AppStrings.unauthorized,
            );
          case StatusCode.notFound:
            throw NotFoundException(AppStrings.notFound);
          case StatusCode.conflict:
            throw ConflictException(
              error.response?.data['message'] ?? AppStrings.serverError,
            );
          case StatusCode.internalServerError:
            throw InternalServerErrorException(
              error.response?.data['message'] ?? AppStrings.serverError,
            );
          default:
            throw ServerException(AppStrings.serverError);
        }
      case DioExceptionType.cancel:
        throw ServerException(AppStrings.internetWeaness);
      case DioExceptionType.unknown:
        throw ServerException(
          error.response?.data['message'] ?? AppStrings.error,
        );
      default:
        throw ServerException(
          error.response?.data['message'] ?? AppStrings.error,
        );
    }
  }
}

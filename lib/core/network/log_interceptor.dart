import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

enum Level { debug, info, warning, error, alien }

// log different colors
void logDebug(String message, {Level level = Level.info}) {
  const String resetColor = '\x1B[0m';
  const String redColor = '\x1B[31m'; // Red
  const String greenColor = '\x1B[32m'; // Green
  const String yellowColor = '\x1B[33m'; // Yellow
  const String cyanColor = '\x1B[36m'; // Cyan

  // Get the current time in hours, minutes, and seconds
  final now = DateTime.now();
  final timeString =
      '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

  if (kDebugMode) {
    try {
      String logMessage;
      switch (level) {
        case Level.debug:
          logMessage = '$cyanColor[DEBUG][$timeString] $message$resetColor';
          break;
        case Level.info:
          logMessage = '$greenColor[INFO][$timeString] $message$resetColor';
          break;
        case Level.warning:
          logMessage =
              '$yellowColor[WARNING][$timeString] $message $resetColor';
          break;
        case Level.error:
          logMessage = '$redColor[ERROR][$timeString] $message $resetColor';
          break;
        case Level.alien:
          logMessage = '$redColor[ALIEN][$timeString] $message $resetColor';
          break;
      }
      debugPrint(logMessage);
    } catch (e) {
      print(e.toString());
    }
  }
}

class LoggerInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final options = err.requestOptions;
    final requestPath = '${options.baseUrl}${options.path}';
    logDebug('onError: ${options.method} request => $requestPath',
        level: Level.error);
    logDebug('onError: ${err.error}, Message: ${err.message}',
        level: Level.error);

    return super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final requestPath = '${options.baseUrl}${options.path}';

    // Log request details
    logDebug(
        '\n\n\n\n.........................................................................');
    logDebug('onRequest: ${options.method} request => $requestPath',
        level: Level.info);
    logDebug('onRequest: Request Headers => ${options.headers}',
        level: Level.info);
    logDebug('onRequest: Request Data => ${_prettyJsonEncode(options.data)}',
        level: Level.info); // Log formatted request data

    // Call the super class to continue handling the request
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logDebug(
        'onResponse: StatusCode: ${response.statusCode}, Data: ${_prettyJsonEncode(response.data)}',
        level: Level.debug);
    logDebug(
        '.........................................................................\n\n\n\n');

    return super.onResponse(response, handler);
  }

  String _prettyJsonEncode(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      final jsonString = encoder.convert(data);
      return jsonString;
    } catch (e) {
      return data.toString();
    }
  }
}

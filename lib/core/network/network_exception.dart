import 'dart:io';

import 'package:dio/dio.dart';

class NetworkExceptionsType {
  static const String requestCancelled = 'requestCancelled';
  static const String requestTimeout = 'requestTimeout';
  static const String noInternetConnection = 'noInternetConnection';
  static const String sendTimeout = 'sendTimeout';
  static const String badRequest = 'badRequest';
  static const String unauthorisedRequest = 'unauthorisedRequest';
  static const String forbidden = 'forbiddenRequest';
  static const String notFound = 'notFound';
  static const String conflict = 'conflict';
  static const String internalServerError = 'internalServerError';
  static const String serviceUnavailable = 'serviceUnavailable';
  static const String defaultError = 'defaultError';
  static const String unexpectedError = 'unexpectedError';
  static const String formatException = 'formatException';
  static const String unableToProcess = 'unableToProcess';
}

class NetworkException implements Exception {
  String? type;
  DioError? dioError;
  Exception? exception;
  Response<dynamic>? response;

  NetworkException({
    this.type,
    this.dioError,
    this.response,
    this.exception,
  });

  String get message => dioError != null
      ? dioError!.toString()
      : exception != null
          ? exception!.toString()
          : '';

  @override
  String toString() {
    var msg = 'NetworkException [$type]: $message';
    return msg;
  }

  static NetworkException getDioException(error) {
    NetworkException networkExceptions = NetworkException();
    if (error is Exception) {
      try {
        if (error is DioError) {
          networkExceptions.dioError = error;
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions.type = NetworkExceptionsType.requestCancelled;
              break;
            case DioErrorType.connectTimeout:
              networkExceptions.type = NetworkExceptionsType.requestTimeout;
              break;
            case DioErrorType.other:
              networkExceptions.type =
                  NetworkExceptionsType.noInternetConnection;
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions.type = NetworkExceptionsType.sendTimeout;
              break;
            case DioErrorType.response:
              {
                networkExceptions.response = error.response;
                switch (error.response?.statusCode) {
                  case 400:
                    networkExceptions.type = NetworkExceptionsType.badRequest;
                    break;
                  case 401:
                    networkExceptions.type =
                        NetworkExceptionsType.unauthorisedRequest;
                    break;
                  case 403:
                    networkExceptions.type = NetworkExceptionsType.forbidden;
                    break;
                  case 404:
                    networkExceptions.type = NetworkExceptionsType.notFound;
                    break;
                  case 409:
                    networkExceptions.type = NetworkExceptionsType.conflict;
                    break;
                  case 408:
                    networkExceptions.type =
                        NetworkExceptionsType.requestTimeout;
                    break;
                  case 500:
                    networkExceptions.type =
                        NetworkExceptionsType.internalServerError;
                    break;
                  case 503:
                    networkExceptions.type =
                        NetworkExceptionsType.serviceUnavailable;
                    break;
                  default:
                    networkExceptions.type = NetworkExceptionsType.defaultError;
                }
                break;
              }
            case DioErrorType.sendTimeout:
              networkExceptions.type = NetworkExceptionsType.sendTimeout;
              break;
          }
        } else if (error is SocketException) {
          networkExceptions.exception = error;
          networkExceptions.type = NetworkExceptionsType.noInternetConnection;
        } else {
          networkExceptions.exception = error;
          networkExceptions.type = NetworkExceptionsType.unexpectedError;
        }
        return networkExceptions;
      } on FormatException catch (error) {
        networkExceptions.exception = error;
        networkExceptions.type = NetworkExceptionsType.formatException;
      } catch (_) {
        networkExceptions.exception = error;
        networkExceptions.type = NetworkExceptionsType.unexpectedError;
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        networkExceptions.exception = error;
        networkExceptions.type = NetworkExceptionsType.unableToProcess;
      } else {
        networkExceptions.exception = error;
        networkExceptions.type = NetworkExceptionsType.unexpectedError;
      }
    }
    return networkExceptions;
  }
}

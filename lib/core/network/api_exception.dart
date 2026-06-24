// lib/core/network/api_exception.dart

import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return ApiException(
          message: 'Connection timeout. Please check your internet.',
          statusCode: 408,
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;
        String message = _extractMessage(data) ?? _statusMessage(statusCode);
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection. Working offline.',
          statusCode: 0,
        );
      default:
        return ApiException(
          message: e.message ?? 'Something went wrong.',
          statusCode: e.response?.statusCode,
        );
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map) {
      return data['message'] as String? ??
          data['error'] as String? ??
          data['msg'] as String?;
    }
    return null;
  }

  static String _statusMessage(int? statusCode) {
    switch (statusCode) {
      case 400: return 'Bad request';
      case 401: return 'Unauthorized. Please login again.';
      case 403: return 'Access forbidden.';
      case 404: return 'Not found.';
      case 409: return 'Conflict. Resource already exists.';
      case 422: return 'Validation error.';
      case 500: return 'Server error. Please try later.';
      default: return 'Unknown error (${statusCode ?? "?"})';
    }
  }

  bool get isNetworkError => statusCode == 0;
  bool get isUnauthorized => statusCode == 401;
  bool get isNotFound => statusCode == 404;
  bool get isServerError => (statusCode ?? 0) >= 500;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
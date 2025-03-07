import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:product_app/core/model/api_response_model.dart';

/// API client for handling network requests
class ApiClient {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  final http.Client _httpClient;

  ApiClient({
    required this.baseUrl,
    this.defaultHeaders = const {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Makes a GET request to the specified endpoint
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint').replace(
        queryParameters: queryParameters,
      );
      print('Requested Url : $baseUrl$endpoint');

      final response = await _httpClient.get(
        uri,
        headers: {...defaultHeaders, ...?headers},
      );

      return _handleResponse(response, fromJson);
    } catch (e) {
      return ApiResponse.error('Network error: ${e.toString()}');
    }
  }

  /// Makes a POST request to the specified endpoint
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await _httpClient.post(
        uri,
        headers: {...defaultHeaders, ...?headers},
        body: jsonEncode(body),
      );

      return _handleResponse(response, fromJson);
    } catch (e) {
      return ApiResponse.error('Network error: ${e.toString()}');
    }
  }

  /// Makes a PUT request to the specified endpoint
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await _httpClient.put(
        uri,
        headers: {...defaultHeaders, ...?headers},
        body: jsonEncode(body),
      );

      return _handleResponse(response, fromJson);
    } catch (e) {
      return ApiResponse.error('Network error: ${e.toString()}');
    }
  }

  /// Makes a DELETE request to the specified endpoint
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');

      final response = await _httpClient.delete(
        uri,
        headers: {...defaultHeaders, ...?headers},
        body: body != null ? jsonEncode(body) : null,
      );

      return _handleResponse(response, fromJson);
    } catch (e) {
      return ApiResponse.error('Network error: ${e.toString()}');
    }
  }

  /// Handles API response and converts it to ApiResponse object
  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic json) fromJson,
  ) {
    if (response.statusCode == 200) {
      try {
        final jsonData = jsonDecode(response.body);
        final data = fromJson(jsonData);
        return ApiResponse.success(data);
      } catch (e) {
        return ApiResponse.error('Parse error: ${e.toString()}');
      }
    } else {
      String errorMessage;
      try {
        final errorJson = jsonDecode(response.body);
        errorMessage = errorJson['message'] ?? 'Server error';
      } catch (_) {
        errorMessage = 'Server error: ${response.statusCode}';
      }
      return ApiResponse.error(errorMessage);
    }
  }

  /// Closes the HTTP client when no longer needed
  void dispose() {
    _httpClient.close();
  }
}

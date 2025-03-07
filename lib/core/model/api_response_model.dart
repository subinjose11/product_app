
/// API response handling class
class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool isSuccess;

  ApiResponse({
    this.data,
    this.error,
    required this.isSuccess,
  });

  factory ApiResponse.success(T data) {
    return ApiResponse(
      data: data,
      isSuccess: true,
    );
  }

  factory ApiResponse.error(String error) {
    return ApiResponse(
      error: error,
      isSuccess: false,
    );
  }
}

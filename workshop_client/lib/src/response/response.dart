class AppResponse<T> {
  final int statusCode;
  final T? data;
  final String? message;
  final String? error;

  AppResponse({
    required this.statusCode,
    this.data,
    this.message,
    this.error,
  });

  factory AppResponse.error(String error) {
    return AppResponse(
      statusCode: 500,
      error: error,
      message: "Something went wrong",
    );
  }

  factory AppResponse.success(String message) {
    return AppResponse(
      statusCode: 200,
      message: message,
    );
  }

  factory AppResponse.notFound(String error) {
    return AppResponse(
      statusCode: 404,
      error: error,
      message: "Not found",
    );
  }
}

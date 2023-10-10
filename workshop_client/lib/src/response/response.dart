class Response<T> {
  final int statusCode;
  final T? data;
  final String? message;
  final String? error;

  Response({
    required this.statusCode,
    this.data,
    this.message,
    this.error,
  });

  factory Response.error(String error) {
    return Response(
      statusCode: 500,
      error: error,
      message: "Something went wrong",
    );
  }

  factory Response.success(String message) {
    return Response(
      statusCode: 200,
      message: message,
    );
  }

  factory Response.notFound(String error) {
    return Response(
      statusCode: 404,
      error: error,
      message: "Not found",
    );
  }
}

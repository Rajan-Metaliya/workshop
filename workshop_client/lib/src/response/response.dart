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
}

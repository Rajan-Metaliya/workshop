class RepoException implements Exception {
  final String message;

  RepoException({String? message})
      : message = message ?? 'Something went wrong';

  @override
  String toString() {
    return message;
  }
}

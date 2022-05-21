class ServerException implements Exception {
  final int code;
  const ServerException(this.code);
}

class InternetException implements Exception {
  final String message;
  const InternetException(this.message);
}

class NetworkingExceptions implements Exception {
  String? message;
  String? code;
  String? body;

  NetworkingExceptions({this.body, this.code, this.message});
}

class BadRequestNetworkingException extends NetworkingExceptions {
  /// Error code: 400
  BadRequestNetworkingException({super.body, super.code, super.message});
}

class UnauthorizedNetworkingException extends NetworkingExceptions {
  /// Error code: 401
  UnauthorizedNetworkingException({super.body, super.code, super.message});
}

class ForbiddenNetworkingException extends NetworkingExceptions {
  /// Error code: 403
  ForbiddenNetworkingException({super.body, super.code, super.message});
}

class NotFoundNetworkingException extends NetworkingExceptions {
  /// Error code: 404
  NotFoundNetworkingException({super.body, super.code, super.message});
}

class InternalErrorNetworkingException extends NetworkingExceptions {
  /// Error code: 500
  InternalErrorNetworkingException({super.body, super.code, super.message});
}

class BadGetwayNetworkingException extends NetworkingExceptions {
  /// Error code: 502
  BadGetwayNetworkingException({super.body, super.code, super.message});
}

class ServiceUnavailableNetworkingException extends NetworkingExceptions {
  /// Error code: 503
  ServiceUnavailableNetworkingException({super.body, super.code, super.message});
}

class GetwayTimeoutNetworkingException extends NetworkingExceptions {
  /// Error code: 504
  GetwayTimeoutNetworkingException({super.body, super.code, super.message});
}

/// Error code: NOT INTERNET
class NotInternetConnectionNetworkingException extends NetworkingExceptions {
  NotInternetConnectionNetworkingException({super.body, super.code, super.message});
}

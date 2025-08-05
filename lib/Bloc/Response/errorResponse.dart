class ErrorResponse {
  String? message; // Direct message field
  List<Errors>? errors; // List of errors
  int? statusCode; // Add status code for better error handling

  // Constructor with message, errors, and statusCode fields
  ErrorResponse({this.message, this.errors, this.statusCode});

  // JSON deserialization
  ErrorResponse.fromJson(Map<String, dynamic> json) {
    // Parse message directly from JSON
    message = json['message'];
    statusCode = json['statusCode'];

    // Parse list of errors if present
    if (json['errors'] != null) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors!.add(Errors.fromJson(v));
      });
    }
  }

  // JSON serialization
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    // Add message to the JSON
    if (message != null) {
      data['message'] = message;
    }

    // Add status code to the JSON
    if (statusCode != null) {
      data['statusCode'] = statusCode;
    }

    // Add list of errors if present
    if (errors != null) {
      data['errors'] = errors!.map((v) => v.toJson()).toList();
    }

    return data;
  }

  // Helper method to check if error is 401
  bool get isUnauthorized => statusCode == 401;

  // Helper method to get the first error message
  String get firstErrorMessage {
    if (message != null && message!.isNotEmpty) {
      return message!;
    }
    if (errors != null && errors!.isNotEmpty) {
      return errors!.first.message ?? "Unknown error";
    }
    return "Unknown error";
  }
}

class Errors {
  String? code;
  String? message;

  Errors({this.code, this.message});

  // JSON deserialization for Errors class
  Errors.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  // JSON serialization for Errors class
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}

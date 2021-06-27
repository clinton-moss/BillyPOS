import 'dart:convert';

class LoginResponse {
  String? token;

  LoginResponse({
    this.token,
  });

  LoginResponse copyWith({
    String? token,
  }) {
    return LoginResponse(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      token: map['Token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponse(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}

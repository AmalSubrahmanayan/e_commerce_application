class SignInModel {
  final String email;
  final String password;

  SignInModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory SignInModel.fromJson(Map<String, dynamic> json) {
    return SignInModel(
      email: json['email'],
      password: json['password'],
    );
  }
}

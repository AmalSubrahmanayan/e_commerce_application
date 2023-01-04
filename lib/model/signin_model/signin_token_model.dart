class SigninTokenModel {
  final String refreshToken;
  final String accessToken;
  SigninTokenModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory SigninTokenModel.fromJson(Map<String, dynamic> json) {
    return SigninTokenModel(
      refreshToken: json['refreshToken'],
      accessToken: json['accessToken'],
    );
  }
}

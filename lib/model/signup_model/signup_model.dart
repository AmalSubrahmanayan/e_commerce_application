class SignUpModel {
  String? fullName;
  String? email;
  String? number;
  String? password;
  SignUpModel({
    required this.fullName,
    required this.email,
    required this.number,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullname': fullName,
      'email': email,
      'password': password,
      'phone': number,
    };
  }

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      fullName: json['fullname'],
      email: json['email'],
      number: json['phone'],
      password: json['password'],
    );
  }
}

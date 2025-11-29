class LoginRequest {
  String? email;
  String? password;

  LoginRequest({this.email, this.password});

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
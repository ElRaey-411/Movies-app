class ResetPasswordRequest {
  ResetPasswordRequest({
    required  this.oldPassword,
    required  this.newPassword,});

 final String oldPassword;
 final String newPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['oldPassword'] = oldPassword;
    map['newPassword'] = newPassword;
    return map;
  }

}
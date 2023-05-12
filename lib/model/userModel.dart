class UserModel {
  int? userType;
  int? paid;
  String? token;
  String? message;
  int? userId;
  String? userEmail;

  UserModel(
      {this.userType,
      this.paid,
      this.token,
      this.message,
      this.userId,
      this.userEmail});

  UserModel.fromJson(Map<String, dynamic> json) {
    userType = json['user_type'];
    paid = json['paid'];
    token = json['token'];
    message = json['message'];
    userId = json['user_id'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_type'] = this.userType;
    data['paid'] = this.paid;
    data['token'] = this.token;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['user_email'] = this.userEmail;
    return data;
  }
}

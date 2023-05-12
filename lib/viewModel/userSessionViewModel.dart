import 'package:flutter/foundation.dart';
import 'package:mvvm_practises/utility/utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';

class UserSessionViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('message', user.message.toString());
    sp.setString('user_email', user.userEmail.toString());
    sp.setInt('userType', user.userType!.toInt());
    sp.setInt('paid', user.paid!.toInt());
    sp.setInt('userId', user.userId!.toInt());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? message = sp.getString('message');
    final String? userEmail = sp.getString('user_email');
    final int? userType = sp.getInt('userType');
    final int? paid = sp.getInt('paid');
    final int? userId = sp.getInt('userId');

    if (kDebugMode) {
      print(
          'Token $token \n message $message \n userEmail $userEmail \n userType $userType \n paid $paid \n userId $userId');
    }
    return UserModel(
      token: token.toString(),
      message: message.toString(),
      userEmail: userEmail.toString(),
      userType: userType,
      paid: paid,
      userId: userId,
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}

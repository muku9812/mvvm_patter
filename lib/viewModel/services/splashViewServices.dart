import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../model/userModel.dart';
import '../../utility/routes/routesName.dart';
import '../userSessionViewModel.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserSessionViewModel().getUser();

  void chechAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));

        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_practises/viewModel/userSessionViewModel.dart';
import 'package:provider/provider.dart';

import '../model/userModel.dart';
import '../repository/authRepository.dart';
import '../utility/routes/routesName.dart';
import '../utility/utilities.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  setSignUpsLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      print(value.toString());
      setLoading(false);
      final userPreference =
          Provider.of<UserSessionViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString(),
        message: value['message'].toString(),
        userEmail: value['userEmail'].toString(),
        paid: value['paid'],
        userType: value['userType'],
        userId: value['userId'],
      ));
      Utilities.snackBar('Login Successful.', context);
      Navigator.pushReplacementNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utilities.toastMessage(error.toString());
        print(error.toString());
      }
    });
  }
}

//   Future<void> signUpApi(dynamic data, BuildContext context) async {
//     setSignUpsLoading(true);
//     _myRepo.signUpApi(data).then((value) {
//       setSignUpsLoading(false);
//       Utilities.toastMessage('Registration Successful.');
//       Navigator.pushReplacementNamed(context, RoutesName.home);
//       if (kDebugMode) {
//         print(value.toString());
//       }
//     }).onError((error, stackTrace) {
//       setSignUpsLoading(false);
//       if (kDebugMode) {
//         Utilities.toastMessage(error.toString());
//         print(error.toString());
//       }
//     });
//   }
// }

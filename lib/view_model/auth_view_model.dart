import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  get loading => _loading;
  setLoading(loading) {
    _loading = loading;
    notifyListeners();
  }

  bool _signUpLoading = false;
  get signUpLoading => _signUpLoading;
  setSignUpLoading(loading) {
    _signUpLoading = loading;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      final sharedPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      sharedPreferences.safeUser(UserModel(token: value['token'].toString()));

      Utils.FlushbarErrorMessage("Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.FlushbarErrorMessage(error.toString(), context);
      }
    });
    notifyListeners();
  }

  Future<void> signUpApi(Map data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.registerApi(data).then((value) {
      if (kDebugMode) {
        setSignUpLoading(false);
        Utils.FlushbarErrorMessage("Sign up successfully", context);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setSignUpLoading(false);
        Utils.FlushbarErrorMessage(error.toString(), context);
      }
    });
    notifyListeners();
  }
}

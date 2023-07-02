import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void userAuthentication(BuildContext context) async {
    getUserData().then((value) {
      if (value.token == "null" || value.token == "") {
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}

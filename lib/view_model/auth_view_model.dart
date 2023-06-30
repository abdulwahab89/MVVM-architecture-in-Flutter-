import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  get loading => _loading;
  setLoading(loading) {
    _loading = loading;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.postApi(data).then((value) {
      if (kDebugMode) {
        setLoading(false);
        Utils.FlushbarErrorMessage('Login Successfully', context);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        setLoading(false);
        Utils.FlushbarErrorMessage(error.toString(), context);
      }
    });
    notifyListeners();
  }
}

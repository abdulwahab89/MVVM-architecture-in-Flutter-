import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();
  Future<dynamic> postApi(dynamic data) async {
    try {
      dynamic response = _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          _apiServices.getPostApiResponse(AppUrl.registeUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

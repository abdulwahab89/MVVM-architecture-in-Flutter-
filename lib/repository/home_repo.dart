import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/model/CartModel.dart';
import 'package:mvvm/model/Product_model.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiService();
  Future<CartModel> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetResponse(AppUrl.cartUri);
      return CartModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/CartModel.dart';
import 'package:mvvm/model/movies_model.dart';
import 'package:mvvm/repository/home_repo.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepo();
  ApiResponse<CartModel> movieList = ApiResponse.loading();
  setMoviesList(ApiResponse<CartModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesList() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value) {
      print(value.carts!.length);
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}

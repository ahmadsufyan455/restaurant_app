import 'package:get/get.dart';
import 'package:restaurant_app/models/detail_restaurant.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/models/review.dart';
import 'package:restaurant_app/utils/constants.dart';

class ApiProvider extends GetConnect {
  Future<RestaurantModel> getRestaurant() async {
    final response = await get('${apiBaseUrl}list');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return RestaurantModel.fromJson(response.body);
    }
  }

  Future<DetailRestaurantModel> getDetailRestaurant(String id) async {
    final response = await get('${apiBaseUrl}detail/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return DetailRestaurantModel.fromJson(response.body);
    }
  }

  Future<RestaurantSearch> getRestaurantResult(String query) async {
    final response = await get('${apiBaseUrl}search?q=$query');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return RestaurantSearch.fromJson(response.body);
    }
  }

  Future<Review> addReview(Map data) async {
    final response = await post('${apiBaseUrl}review', data);
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Review.fromJson(response.body);
    }
  }
}

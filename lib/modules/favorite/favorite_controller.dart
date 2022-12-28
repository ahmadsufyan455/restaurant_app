import 'package:get/get.dart';
import 'package:restaurant_app/models/restaurant.dart';

import '../../database/database_helper.dart';

class FavoriteController extends GetxController {
  RxList<Restaurants> restaurants = <Restaurants>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    super.onInit();
    getRestaurants();
  }

  void getRestaurants() async {
    restaurants.value = await _dbHelper.getRestaurants();
  }
}

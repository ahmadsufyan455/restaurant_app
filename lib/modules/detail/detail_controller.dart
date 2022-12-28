import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/models/detail_restaurant.dart';
import 'package:restaurant_app/modules/favorite/favorite_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/database_helper.dart';
import '../../models/restaurant.dart';
import '../../services/api_provider.dart';

class DetailController extends GetxController
    with StateMixin<DetailRestaurantModel> {
  final _apiProvider = ApiProvider();
  late SharedPreferences prefs;

  void getRestaurants() => Get.find<FavoriteController>().getRestaurants();

  final DatabaseHelper _dbHelper = DatabaseHelper();
  RxBool isFavorite = false.obs;

  var connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  final String id = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    _apiProvider.getDetailRestaurant(id).then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
    prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(id) != null) {
      isFavorite.value = prefs.getBool(id)!;
    }
  }

  Future<void> addRestaurant(Restaurants restaurant, bool isFavorite) async {
    await _dbHelper.insertRestaurant(restaurant);
    await prefs.setBool(id, isFavorite);
    getRestaurants();
  }

  void deleteRestaurant(String id) async {
    await _dbHelper.deleteRestaurant(id);
    await prefs.remove(id);
    getRestaurants();
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    connectivityResult = await (_connectivity.checkConnectivity());
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
        Get.snackbar('Error', 'Failed to get connection type');
        break;
    }
  }

  @override
  void onClose() {
    super.onClose();
    _streamSubscription.cancel();
  }
}

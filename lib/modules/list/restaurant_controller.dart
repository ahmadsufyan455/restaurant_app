import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/services/api_provider.dart';

class RestaurantController extends GetxController
    with StateMixin<RestaurantModel> {
  final _apiProvider = ApiProvider();

  var connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    _apiProvider.getRestaurant().then((response) {
      change(response, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
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

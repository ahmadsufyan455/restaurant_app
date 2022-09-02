import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:restaurant_app/services/api_provider.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ReviewController extends GetxController {
  final _apiProvider = ApiProvider();
  late TextEditingController nameController;
  late TextEditingController reviewController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    reviewController = TextEditingController();
  }

  void showDialogPogressIndicator() {
    Get.dialog(
      Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: kAmber,
          size: 50.0,
        ),
      ),
      barrierDismissible: false,
    );
  }

  void addReview(Map data, String id) {
    showDialogPogressIndicator();
    try {
      _apiProvider.addReview(data).then((_) {
        Navigator.of(Get.overlayContext!).pop();
        Get.back();
        Get.snackbar(
          'Review added',
          'Your review has been successfully added!',
        );
      });
    } catch (e) {
      Get.snackbar(
        'Failed to add review',
        'Your review has not been successfully added!',
      );
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    reviewController.dispose();
  }
}

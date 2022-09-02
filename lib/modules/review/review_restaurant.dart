import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/models/review.dart';
import 'package:restaurant_app/modules/review/review_controller.dart';
import 'package:restaurant_app/utils/styles.dart';

class ReviewRestaurant extends StatelessWidget {
  const ReviewRestaurant({Key? key}) : super(key: key);

  static const routeName = '/review';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewController());
    final String id = Get.arguments;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                  Text('add_review'.tr, style: kHeadingRegular),
                  IconButton(
                    onPressed: () {
                      final review = ReviewModel(
                        id: id,
                        name: controller.nameController.text,
                        review: controller.reviewController.text,
                      );
                      controller.addReview(review.toJson(), id);
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              TextField(
                controller: controller.nameController,
                style: kBodyRegular,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'name'.tr,
                  hintStyle: kBodyRegularHint,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kAmber, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: controller.reviewController,
                style: kBodyRegular,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'review'.tr,
                  hintStyle: kBodyRegularHint,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: kAmber, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

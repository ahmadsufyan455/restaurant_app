import 'package:flutter/material.dart';
import 'package:restaurant_app/modules/favorite/favorite_controller.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:get/get.dart';
import 'package:restaurant_app/widgets/item_list.dart';
import 'package:restaurant_app/widgets/not_found.dart';

import '../../utils/styles.dart';
import '../detail/detail_restaurant.dart';

class FavoriteRestaurant extends StatelessWidget {
  const FavoriteRestaurant({Key? key}) : super(key: key);

  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kBlack,
        ),
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'favourites'.tr,
          style: kHeadingRegular,
        ),
      ),
      body: Obx(
        () => controller.restaurants.isEmpty
            ? const Center(
                child: NotFoundState(),
              )
            : ListView.builder(
                itemCount: controller.restaurants.length,
                itemBuilder: (context, index) {
                  final data = controller.restaurants[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        DetailRestaurant.routeName,
                        arguments: data.id,
                      );
                    },
                    child: ItemList(
                      name: data.name!,
                      image: imageSmall + data.pictureId!,
                      description: data.description!,
                      city: data.city!,
                      rating: data.rating!.toString(),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

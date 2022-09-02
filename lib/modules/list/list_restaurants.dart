import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/modules/detail/detail_restaurant.dart';
import 'package:restaurant_app/modules/list/restaurant_controller.dart';
import 'package:restaurant_app/modules/search/search_restaurant.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';
import 'package:restaurant_app/widgets/empty_data.dart';
import 'package:restaurant_app/widgets/item_list.dart';
import 'package:restaurant_app/widgets/no_connection.dart';
import 'package:restaurant_app/widgets/not_found.dart';

class ListRestaurants extends StatelessWidget {
  const ListRestaurants({Key? key}) : super(key: key);

  static const routeName = '/list_restaurants';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestaurantController());
    return Scaffold(
      backgroundColor: kGreyWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'restaurant'.tr,
                        style: kHeadingBold,
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'recommendation'.tr,
                        style: kBodyRegular,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Get.toNamed(SearchRestaurant.routeName),
                    icon: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.shade200,
                      ),
                      child: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.connectionType.value == 0
                    ? const Center(
                        child: NoConnectionState(),
                      )
                    : controller.obx(
                        (data) => data!.restaurants!.isNotEmpty
                            ? itemList(data)
                            : const NotFoundState(),
                        onEmpty: const EmptyData(),
                        onError: (error) => Text(
                          'error'.tr + error!,
                        ),
                        onLoading: Center(
                          child: LoadingAnimationWidget.fourRotatingDots(
                            color: kAmber,
                            size: 50.0,
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(RestaurantModel? data) {
    return ListView.builder(
      itemCount: data!.restaurants!.length,
      itemBuilder: (_, index) {
        final restaurantData = data.restaurants![index];
        return GestureDetector(
          onTap: () => Get.toNamed(
            DetailRestaurant.routeName,
            arguments: restaurantData.id,
          ),
          child: ItemList(
            name: restaurantData.name!,
            image: imageSmall + restaurantData.pictureId!,
            description: restaurantData.description!,
            city: restaurantData.city!,
            rating: restaurantData.rating!.toString(),
          ),
        );
      },
    );
  }
}

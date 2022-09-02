import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/modules/search/search_controller.dart';
import 'package:restaurant_app/utils/styles.dart';
import 'package:restaurant_app/widgets/empty_data.dart';
import 'package:restaurant_app/widgets/not_found.dart';

import '../../utils/constants.dart';
import '../../widgets/item_list.dart';
import '../detail/detail_restaurant.dart';

class SearchRestaurant extends StatelessWidget {
  const SearchRestaurant({Key? key}) : super(key: key);

  static const routeName = '/search_restaurant';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return Scaffold(
      backgroundColor: kGreyWhite,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
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
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: controller.searchController,
                      style: kBodyRegular,
                      onSubmitted: (query) =>
                          controller.getRestaurantResult(query),
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: 'Search restaurant...',
                        hintStyle: kBodyRegularHint,
                        prefixIcon: const Icon(Icons.search),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: controller.obx(
                (data) => data!.restaurants!.isNotEmpty
                    ? itemList(data)
                    : const NotFoundState(),
                onEmpty: const EmptyData(),
                onError: (error) => Text(
                  'Something went wrong : $error',
                ),
                onLoading: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: kAmber,
                    size: 50.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemList(RestaurantSearch? data) {
    return ListView.builder(
      itemCount: data!.restaurants!.length,
      itemBuilder: ((_, index) {
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
      }),
    );
  }
}

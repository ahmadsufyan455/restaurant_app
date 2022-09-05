import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:restaurant_app/modules/detail/detail_restaurant.dart';
import 'package:restaurant_app/modules/favorite/favorite_restaurant.dart';
import 'package:restaurant_app/modules/list/restaurant_controller.dart';
import 'package:restaurant_app/modules/profile/author_profile.dart';
import 'package:restaurant_app/modules/search/search_restaurant.dart';
import 'package:restaurant_app/modules/settings/settings_page.dart';
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
    final advancedDrawerController = AdvancedDrawerController();
    return AdvancedDrawer(
      backdropColor: Colors.blueGrey,
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Lottie.asset(
                  '$lottiePath/resto.json',
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(AuthorProfile.routeName),
                leading: const Icon(Icons.account_circle_rounded),
                title: Text(
                  'profile'.tr,
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(FavoriteRestaurant.routeName),
                leading: const Icon(Icons.favorite_rounded),
                title: Text(
                  'favourites'.tr,
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(SettingPage.routeName),
                leading: const Icon(Icons.settings_rounded),
                title: Text(
                  'settings'.tr,
                  style: kBodyRegular.copyWith(color: kWhite),
                ),
              ),
              const Spacer(),
              Text(
                'The resto v1.0',
                style: kBodyRegular.copyWith(color: kWhite),
              ),
              const SizedBox(height: 34.0),
            ],
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: kGreyWhite,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => advancedDrawerController.showDrawer(),
                      icon: ValueListenableBuilder<AdvancedDrawerValue>(
                        valueListenable: advancedDrawerController,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.grey.shade200,
                              ),
                              child: Icon(
                                value.visible
                                    ? Icons.clear_rounded
                                    : Icons.menu_rounded,
                                key: ValueKey<bool>(value.visible),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      'restaurant'.tr,
                      style: kHeadingBold,
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
              Text(
                'recommendation'.tr,
                style: kBodyRegular,
              ),
              const SizedBox(height: 16.0),
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

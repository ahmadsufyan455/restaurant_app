import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:restaurant_app/modules/detail/detail_controller.dart';
import 'package:restaurant_app/modules/review/review_restaurant.dart';
import 'package:restaurant_app/utils/constants.dart';
import 'package:restaurant_app/utils/styles.dart';
import 'package:restaurant_app/widgets/empty_data.dart';
import 'package:restaurant_app/widgets/no_connection.dart';

class DetailRestaurant extends StatelessWidget {
  const DetailRestaurant({Key? key}) : super(key: key);

  static const routeName = '/detail_restaurant';

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments;
    final controller = Get.put(DetailController(id: id));
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: kBlack,
        ),
        backgroundColor: kWhite,
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Detail',
          style: kHeadingRegular,
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => controller.connectionType.value == 0
              ? const Center(
                  child: NoConnectionState(),
                )
              : controller.obx(
                  (data) {
                    final restaurantData = data!.restaurant!;
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Hero(
                                tag: restaurantData.name!,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: CachedNetworkImage(
                                    placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                    imageUrl:
                                        imageLarge + restaurantData.pictureId!,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text(restaurantData.name!, style: kHeadingBold),
                            const SizedBox(height: 4.0),
                            SizedBox(
                              height: 35.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data.restaurant!.categories!.length,
                                itemBuilder: (_, index) {
                                  final categories = data
                                      .restaurant!.categories!
                                      .map((value) => value.name)
                                      .toList();
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 6.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categories[index]!,
                                        style: kBodyRegular,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: kBlue,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: const Icon(Icons.location_on,
                                          color: kWhite),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      restaurantData.city!,
                                      style: kBodyRegular,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 24.0),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: BoxDecoration(
                                        color: kAmber,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child:
                                          const Icon(Icons.star, color: kWhite),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      restaurantData.rating!.toString(),
                                      style: kBodyBold,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            ReadMoreText(
                              '${restaurantData.description!} ',
                              style: kBodyRegular,
                              trimLines: 5,
                              colorClickableText: kAmber,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'more'.tr,
                              trimExpandedText: 'less'.tr,
                            ),
                            const SizedBox(height: 16.0),
                            Text('foods'.tr, style: kBodyBold),
                            const SizedBox(height: 4.0),
                            SizedBox(
                              height: 35.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurantData.menus!.foods!.length,
                                itemBuilder: (_, index) {
                                  final foods = data.restaurant!.menus!.foods!
                                      .map((value) => value.name)
                                      .toList();
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 6.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        foods[index]!,
                                        style: kBodyRegular,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            Text('drinks'.tr, style: kBodyBold),
                            const SizedBox(height: 4.0),
                            SizedBox(
                              height: 35.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: restaurantData.menus!.drinks!.length,
                                itemBuilder: (_, index) {
                                  final drinks = data.restaurant!.menus!.drinks!
                                      .map((value) => value.name)
                                      .toList();
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 6.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Center(
                                      child: Text(
                                        drinks[index]!,
                                        style: kBodyRegular,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Divider(color: kBlack),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('reviews'.tr, style: kBodyBold),
                                TextButton(
                                  onPressed: () {
                                    Get.toNamed(
                                      ReviewRestaurant.routeName,
                                      arguments: restaurantData.id,
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: kBlue,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      'add_review'.tr,
                                      style: kBodyRegular.copyWith(
                                        color: kWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            SizedBox(
                              height: 70.0,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    restaurantData.customerReviews!.length,
                                itemBuilder: (_, index) {
                                  final reviews = restaurantData
                                      .customerReviews!
                                      .map((value) => value)
                                      .toList();
                                  return Container(
                                    margin: const EdgeInsets.only(right: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 6.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.person,
                                              color: kGrey,
                                            ),
                                            const SizedBox(width: 8.0),
                                            Text(
                                              '${reviews[index].name!} - ${reviews[index].date!}',
                                              style: kBodyRegular,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          reviews[index].review!,
                                          style: kBodyRegular,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
    );
  }
}

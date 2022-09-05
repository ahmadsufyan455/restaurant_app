import 'package:get/get.dart';
import 'package:restaurant_app/modules/detail/detail_restaurant.dart';
import 'package:restaurant_app/modules/favorite/favorite_restaurant.dart';
import 'package:restaurant_app/modules/list/list_restaurants.dart';
import 'package:restaurant_app/modules/profile/author_profile.dart';
import 'package:restaurant_app/modules/review/review_restaurant.dart';
import 'package:restaurant_app/modules/search/search_restaurant.dart';
import 'package:restaurant_app/modules/settings/settings_page.dart';
import 'package:restaurant_app/modules/splash/splash_screen.dart';

List<GetPage> routes = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: ListRestaurants.routeName,
    page: () => const ListRestaurants(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: DetailRestaurant.routeName,
    page: () => const DetailRestaurant(),
    transition: Transition.zoom,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: SearchRestaurant.routeName,
    page: () => const SearchRestaurant(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: ReviewRestaurant.routeName,
    page: () => const ReviewRestaurant(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: SettingPage.routeName,
    page: () => const SettingPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: FavoriteRestaurant.routeName,
    page: () => const FavoriteRestaurant(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
  GetPage(
    name: AuthorProfile.routeName,
    page: () => const AuthorProfile(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 300),
  ),
];

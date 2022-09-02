import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/utils/styles.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    required this.name,
    required this.image,
    required this.description,
    required this.city,
    required this.rating,
    Key? key,
  }) : super(key: key);

  final String name;
  final String image;
  final String description;
  final String city;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: kBodyBold),
                        const SizedBox(height: 4.0),
                        Text(
                          '${description.substring(0, 30)}...',
                          style: kBodyRegular,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Hero(
                    tag: name,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        imageUrl: image,
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Divider(color: kBlack),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: kBlue,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Icon(Icons.location_on, color: kWhite),
                      ),
                      const SizedBox(width: 10.0),
                      Text(city, style: kBodyRegular),
                    ],
                  ),
                  const SizedBox(width: 24.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: kAmber,
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                        child: const Icon(Icons.star, color: kWhite),
                      ),
                      const SizedBox(width: 10.0),
                      Text(rating, style: kBodyBold),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

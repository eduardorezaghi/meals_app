import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: InkWell(
      onTap: () {},
      child: Stack(
        children: [
          FadeInImage(
            // This is a placeholder for the image.
            // The image will be loaded from the network, thus we need to show a placeholder
            // so things don't look weird when the image is loading.
            placeholder: MemoryImage(kTransparentImage),
            // This is the image loaded from the network.
            image: NetworkImage(meal.imageUrl),
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

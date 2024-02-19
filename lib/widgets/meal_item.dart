import 'package:flutter/material.dart';
import 'package:meals/theme/color_palletes.dart';
import 'package:meals/theme/text_style.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:meals/widgets/meal_item_trait.dart';
import 'package:meals/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    required this.meal,
    required this.onSelectMeal,
  });

  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(children: [
          FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(meal.imageUrl),
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 150,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Palletes.accent,
                  // Palletes.bg.withOpacity(0.3),
                  const Color.fromARGB(0, 0, 0, 0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 5),
                      child: Text(
                        meal.title,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: appStyle(
                            fw: FontWeight.bold,
                            size: 20,
                            color: Palletes.text),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemTrait(
                            icon: Icons.schedule,
                            label: " ${meal.duration} min"),
                        MealItemTrait(
                            icon: Icons.work,
                            label:
                                " ${meal.complexity.name[0].toUpperCase() + meal.complexity.name.substring(1)}"),
                        MealItemTrait(
                            icon: Icons.attach_money_rounded,
                            label:
                                " ${meal.affordability.name[0].toUpperCase() + meal.affordability.name.substring(1)}"),
                      ],
                    )
                  ],
                ),
              ))
        ]),
      ),
    );
  }
}

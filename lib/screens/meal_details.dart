import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favourite_meals_provider.dart';
import 'package:meals/theme/color_palletes.dart';
import 'package:meals/theme/text_style.dart';

class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({super.key, required this.meal});
  final Meal meal;

  @override
  ConsumerState<MealDetailsScreen> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteMeals = ref.watch(favouriteMealsProvider);
    final isFavourited = favouriteMeals.contains(widget.meal);
    return Scaffold(
      backgroundColor: Palletes.bg,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: Palletes.bg,
        elevation: 0,
        title: Text(
          widget.meal.title,
          maxLines: 2,
          style: appStyle(fw: FontWeight.bold, size: 20, color: Palletes.text),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  final wasAdded = ref
                      .read(favouriteMealsProvider.notifier)
                      .toggleMealFavoriteStatus(widget.meal);
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(wasAdded == true
                          ? "meal removed from favourites."
                          : "meal added to favourites.")));
                });
              },
              icon: Icon(
                Icons.favorite_rounded,
                color: isFavourited ? Palletes.accent : Palletes.text,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Palletes.accent, width: 5),
                    borderRadius: BorderRadius.circular(28)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image.network(
                      widget.meal.imageUrl,
                      width: double.infinity,
                    )),
              ),
              const SizedBox(height: 20),
              Text(" Ingredients",
                  style: appStyle(
                      fw: FontWeight.bold, size: 25, color: Palletes.accent)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Palletes.accent),
                    borderRadius: BorderRadius.circular(22),
                    color: Palletes.bg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        widget.meal.ingredients.length,
                        (index) => Text("${widget.meal.ingredients[index]}\n",
                            textAlign: TextAlign.start,
                            style: appStyle(
                                fw: FontWeight.bold,
                                size: 20,
                                color: Palletes.accent)))
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Text(" Steps",
                  style: appStyle(
                      fw: FontWeight.bold, size: 25, color: Palletes.accent)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Palletes.accent),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(
                        widget.meal.steps.length,
                        (index) => Text(
                            "${index + 1}. ${widget.meal.steps[index]}\n",
                            textAlign: TextAlign.start,
                            style: appStyle(
                                fw: FontWeight.bold,
                                size: 20,
                                color: Palletes.accent))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

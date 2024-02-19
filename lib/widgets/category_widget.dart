import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/theme/color_palletes.dart';
import 'package:meals/theme/text_style.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget(
      {super.key, required this.category, required this.onSelectCategory});
  final Category category;
  final void Function() onSelectCategory;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Opacity(
            opacity: 0.85,
            child: Image(
              width: 300,
              height: 400,
              image: AssetImage(category.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        InkWell(
          splashColor: Palletes.primary,
          onTap: onSelectCategory,
          borderRadius: BorderRadius.circular(22),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: 300,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: LinearGradient(colors: [
                  Palletes.accent,
                  Palletes.bg.withOpacity(0.3),
                  const Color.fromARGB(0, 0, 0, 0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            child: Column(
              children: [
                const Spacer(),
                Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: appStyle(
                      fw: FontWeight.bold, size: 23, color: Palletes.text),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

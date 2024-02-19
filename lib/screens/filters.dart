import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/theme/color_palletes.dart';
import 'package:meals/theme/text_style.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      backgroundColor: const Color(0xff070d18),
      appBar: AppBar(
        backgroundColor: const Color(0xff070d18),
        elevation: 0,
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SwitchListTile(
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              title: Text(
                "Glueten-free",
                style: appStyle(
                    fw: FontWeight.w600, size: 25, color: Palletes.accent),
              ),
              subtitle: Text(
                "Glueten-free meals only",
                style: appStyle(
                    fw: FontWeight.w200, size: 15, color: Palletes.text),
              ),
              activeColor: Palletes.accent,
              contentPadding: const EdgeInsets.all(10),
              trackOutlineColor: MaterialStatePropertyAll(Palletes.accent),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  side: BorderSide(color: Palletes.accent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SwitchListTile(
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              title: Text(
                "Lactose-free",
                style: appStyle(
                    fw: FontWeight.w600, size: 25, color: Palletes.accent),
              ),
              subtitle: Text(
                "Lactose-free meals only",
                style: appStyle(
                    fw: FontWeight.w200, size: 15, color: Palletes.text),
              ),
              activeColor: Palletes.accent,
              contentPadding: const EdgeInsets.all(10),
              trackOutlineColor: MaterialStatePropertyAll(Palletes.accent),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  side: BorderSide(color: Palletes.accent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SwitchListTile(
              value: activeFilters[Filter.vegetarian]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegetarian, isChecked);
              },
              title: Text(
                "Vegetarian",
                style: appStyle(
                    fw: FontWeight.w600, size: 25, color: Palletes.accent),
              ),
              subtitle: Text(
                "Vegetarian meals only",
                style: appStyle(
                    fw: FontWeight.w200, size: 15, color: Palletes.text),
              ),
              activeColor: Palletes.accent,
              contentPadding: const EdgeInsets.all(10),
              trackOutlineColor: MaterialStatePropertyAll(Palletes.accent),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  side: BorderSide(color: Palletes.accent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: SwitchListTile(
              value: activeFilters[Filter.vegan]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.vegan, isChecked);
              },
              title: Text(
                "Vegan",
                style: appStyle(
                    fw: FontWeight.w600, size: 25, color: Palletes.accent),
              ),
              subtitle: Text(
                "Vegan meals only",
                style: appStyle(
                    fw: FontWeight.w200, size: 15, color: Palletes.text),
              ),
              activeColor: Palletes.accent,
              contentPadding: const EdgeInsets.all(10),
              trackOutlineColor: MaterialStatePropertyAll(Palletes.accent),
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(22)),
                  side: BorderSide(color: Palletes.accent)),
            ),
          ),
        ],
      ),
    );
  }
}

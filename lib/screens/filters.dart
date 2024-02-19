import 'package:flutter/material.dart';
import 'package:meals/theme/color_palletes.dart';
import 'package:meals/theme/text_style.dart';

// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070d18),
      appBar: AppBar(
        backgroundColor: const Color(0xff070d18),
        elevation: 0,
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                  });
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
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                  });
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
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                  });
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
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                  });
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
      ),
    );
  }
}

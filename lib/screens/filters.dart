import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.onSave,
  });

  final void Function() onSave;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // States to manage the filters
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adjust your meal selection'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text('Gluten-free'),
            subtitle: const Text('Only include gluten-free meals.'),
            value: _glutenFree,
            onChanged: (value) {
              setState(() {
                _glutenFree = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegetarian'),
            subtitle: const Text('Only include vegetarian meals.'),
            value: _vegetarian,
            onChanged: (value) {
              setState(() {
                _vegetarian = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Vegan'),
            subtitle: const Text('Only include vegan meals.'),
            value: _vegan,
            onChanged: (value) {
              setState(() {
                _vegan = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Lactose-free'),
            subtitle: const Text('Only include lactose-free meals.'),
            value: _lactoseFree,
            onChanged: (value) {
              setState(() {
                _lactoseFree = value;
              });
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: widget.onSave,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

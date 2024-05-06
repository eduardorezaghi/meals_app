import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
    required this.onNavigate,
  });

  final void Function(String identifier) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              ])),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Cooking Up!',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              )),
          ListTile(
            leading: const Icon(Icons.shop),
            title: Text(
              'Menu',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              onNavigate('meals');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: Text(
              'Favorites',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              // TODO: Handle with GoRouter and Riverpod later.
              onNavigate('favorites');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () {
              // TODO: Handle with GoRouter and Riverpod later.
              onNavigate('filters');
            },
          ),
        ],
      ),
    );
  }
}

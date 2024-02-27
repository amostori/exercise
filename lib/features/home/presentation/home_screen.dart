import 'package:drawing_tutorial/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> entries = <String>[
    'Noworodek',
    '1 m.ż.',
    '2 m.ż.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(AppRoute.exercise.name);
        },
        child: const Icon(Icons.sports_basketball),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              context.goNamed(AppRoute.details.name,
                  pathParameters: {'weight': index.toString()});
            },
            title: Text(entries[index]),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

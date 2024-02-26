import 'package:drawing_tutorial/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final List<String> entries = <String>['Noworodek', '3 m.ż.', '6 r.ż.'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.yellow[colorCodes[index]],
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: ListTile(
              onTap: () {
                context.goNamed(AppRoute.detail.name,
                    pathParameters: {'weight': index.toString()});
              },
              title: Text(entries[index]),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

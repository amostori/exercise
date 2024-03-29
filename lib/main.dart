import 'package:drawing_tutorial/features/home/presentation/home_screen.dart';
import 'package:drawing_tutorial/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routeByName,
      restorationScopeId: 'app',
      debugShowCheckedModeBanner: false,
    );
  }
}

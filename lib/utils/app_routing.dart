import 'package:drawing_tutorial/features/details/presentation/detail_screen.dart';
import 'package:drawing_tutorial/features/excersise/presentation/exercise_screen.dart';
import 'package:drawing_tutorial/features/home/presentation/home_screen.dart';
import 'package:go_router/go_router.dart';

import 'error_page.dart';

enum AppRoute { home, details, exercise }

final routeByName = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: false,
    errorBuilder: (context, state) => const ErrorPage(),
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.home.name,
          builder: (context, state) => HomeScreen(),
          routes: [
            GoRoute(
              path: 'detail/:weight',
              name: AppRoute.details.name,
              builder: (context, state) {
                final weight = state.pathParameters['weight']!;
                return DetailsScreen(int.parse(weight));
              },
            ),
            GoRoute(
              path: 'exercise',
              name: AppRoute.exercise.name,
              builder: (context, state) {
                // final weight = state.pathParameters['weight']!;
                return const ExerciseScreen();
              },
            ),
          ]),
    ]);

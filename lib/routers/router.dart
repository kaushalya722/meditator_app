import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/pages/single_mindfull_exercise.dart';
import 'package:meditator_app/routers/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RoutesNames.mainPage,
        builder: (context, state) {
          return MainScreen();
        }
        ),
        GoRoute(
          path: "/mindfullExercise",
          name: RoutesNames.mindfullExercise,
          builder: (context, state) {
            final mindfulnessExerciseJson = state.uri.queryParameters["mindfullExercise"];
            final mindfulnessExercise = MindFulnessExercise.fromJson(
              jsonDecode(mindfulnessExerciseJson!)//convert mindfull exercise json format into object
              );
            return SingleMindfullExercisePage(
              mindfullnessExercise: mindfulnessExercise);
          },

          )
    ]);
}
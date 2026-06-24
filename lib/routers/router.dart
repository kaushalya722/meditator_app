import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/function_data_model.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/pages/functions_page.dart';
import 'package:meditator_app/pages/main_screen.dart';
import 'package:meditator_app/pages/mindfull_exercise_timer.dart';
import 'package:meditator_app/pages/single_mindfull_exercise.dart';
import 'package:meditator_app/pages/sleep_exercise_timer.dart';
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

          ),
          GoRoute(
            path: "/functions",
            name: RoutesNames.functions,
            builder: (context, state) {
              final FunctionData functionData = state.extra as FunctionData;
              return FunctionsPage(functionData: functionData);
            },
            ),
            GoRoute(
              path: "/mindfullExerciseTimer",
              name: RoutesNames.mindfullExerciseTimer,
              builder: (context, state) {
                final mindfullExerciseJson = state.uri.queryParameters["mindfullExercise"];
                final mindfulnessExercise = MindFulnessExercise.fromJson(jsonDecode(mindfullExerciseJson!),);
                return MindfullExerciseTimer(
                  mindfullExercise: mindfulnessExercise);
              },
              ),
              GoRoute(
              path: "/sleepExerciseTimer",
              name: RoutesNames.sleepExerciseTimer,
              builder: (context, state) {
                final sleepExerciseJson = state.uri.queryParameters["sleepExercise"];
                final SleepExercise sleepExercise = SleepExercise.fromJson(jsonDecode(sleepExerciseJson!));
                   return SleepExerciseTimerPage(
                    sleepExercise: sleepExercise,
                    );
              },
              )
    ]);
}
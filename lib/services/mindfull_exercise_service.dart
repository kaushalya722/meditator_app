import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';

class MindfullExerciseService {
  var mindfulnessBox = Hive.box("mindfulness_data");

  //method to add a new mindfull exercise
  Future<void> addMindfullExercise(MindFulnessExercise mindfullExercise, BuildContext context) async{
    try {
  final allMindfullExercises = mindfulnessBox.get("mindfulness_data") ?? [];
  
  allMindfullExercises.add(mindfullExercise);
  
  await mindfulnessBox.put("mindfulness_data", allMindfullExercises);
  
  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text("Mindfull Exercise added!"),
    duration: Duration(seconds: 2),
    ),
    );
}catch (e) {
  print("Service error : $e");
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Error adding Mindfull Exercise!"),
      duration: Duration(seconds: 2),
      ),
  );
}
  }
}
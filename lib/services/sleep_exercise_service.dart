import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';

class SleepExerciseService {
  var sleepBox = Hive.box("sleep_data");

  //method to add new sleep Exercise
  Future<void> addSleepExercise(SleepExercise sleepExercise, BuildContext context) async {
    try {
  final allSleepExercises = sleepBox.get("sleep_data") ?? [];
  
  await allSleepExercises.add(sleepExercise);
  
  await sleepBox.put("sleep_data", allSleepExercises);
  
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Sleep Exercise added!"),
      duration: Duration(seconds: 2),
      ),
  );
}catch (error) {
  print("Service error : $error");
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text("Error adding new Sleep Exercise!"),
      duration: Duration(seconds: 2),
      ),
  );
}
  }
}
import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/services/meditation_service.dart';
import 'package:meditator_app/services/mindfull_exercise_service.dart';
import 'package:meditator_app/services/sleep_exercise_service.dart';

class CustomDataProvider extends ChangeNotifier{
  final List<MeditationExercise> _meditations = [];
  final List<SleepExercise> _sleepExercises = [];
  final List<MindFulnessExercise> _mindfullExercises = [];

  //getter
  List<MeditationExercise> get meditations => _meditations;
  List<SleepExercise> get sleepExercises => _sleepExercises;
  List<MindFulnessExercise> get mindfullExercises => _mindfullExercises;

  //method to add a meditation
  void addMeditation(MeditationExercise meditation, BuildContext context){
    try{
      _meditations.add(meditation);
      try{
        MeditationService().addMeditation(meditation, context);
      }catch(error){
        print("Provider local storage error : $error");
      }
      notifyListeners();

    }catch(error){
      print("Provider Error : $error");
    }
  }


  //method to add a new sleep exercise
  void addSleepExercise(SleepExercise sleepExercise, BuildContext context){
    try{
      _sleepExercises.add(sleepExercise);
      try{
        SleepExerciseService().addSleepExercise(sleepExercise, context);
      }catch(e){
        print("Error provider local storage : $e");
      }
      notifyListeners();
    }catch(error){
      print("Error from provider : $error");
    }
  }

  //method to add a new mindfull exercise
  void addNewMindfulExercise(MindFulnessExercise mindfulExercise, BuildContext context){
     try{
      _mindfullExercises.add(mindfulExercise);
      try{
        MindfullExerciseService().addMindfullExercise(mindfulExercise, context);
      }catch(error){
        print("Provider local storage error : $error");
      }
      notifyListeners();
     }catch(e){
      print("Provider error : $e");
     }
  }
}
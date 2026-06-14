import 'package:flutter/material.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/providers/meditation_provider.dart';
import 'package:meditator_app/providers/mindfull_exercise_provider.dart';
import 'package:meditator_app/providers/sleep_exercise_provider.dart';
import 'package:provider/provider.dart';

class FilterProvider extends ChangeNotifier {
  List<dynamic> _allData = [];
  List<dynamic> _filterData = [];
  String _selectedCategory = "All";

  //get all the data from other providers
  Future<void> getData(BuildContext context) async {
    //Ensure this run after build
    await Future.delayed(Duration.zero);

    //midfull exercise
    final List<MindFulnessExercise> mindfullExercises = 
    Provider.of<MindfullExerciseProvider>(context, listen: false).mindfullExercise;
    //listen:false (to get latest value)

    //meditations
    final List<MeditationExercise> meditationExercises = 
    Provider.of<MeditationProvider>(context, listen: false).meditationExercises;

    //sleep exercises
    final List<SleepExercise> sleepExercises = 
    Provider.of<SleepExerciseProvider>(context, listen: false).sleepExercises;

    _allData = [
      ...mindfullExercises, 
      ...meditationExercises, 
      ...sleepExercises]; //tale all items from each list

      _filterData = _allData;

      notifyListeners();

  }
  //getter 
  List<dynamic> get filterData => _filterData;

  //method to filter data
  void filteredData (String category) {
      _selectedCategory = category;
      if(category == "All"){
        _filterData = _allData;
      }else if(category == "Mindfullness"){
        _filterData = _allData.whereType<MindFulnessExercise>().toList();
      }else if(category == "Meditation"){
        _filterData = _allData.whereType<MeditationExercise>().toList();
      }else if(category == "Sleep Stories"){
        _filterData = _allData.whereType<SleepExercise>().toList();
      }
      notifyListeners(); //to update listeners
  }

  //method to return category name
  String getSelectedCategoryName(){
    return _selectedCategory;
  }
}
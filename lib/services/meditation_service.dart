import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator_app/models/meditation_exercise_model.dart';

class MeditationService {
  var meditationBox = Hive.box('meditation_data');

  //method to add a new meditation
  Future<void> addMeditation(MeditationExercise meditation, BuildContext context) async{
    try{
      //get all data already stored
      //created new data convert to JSON format and add
      //then put all data set to the box
      final dynamic allMeditation = meditationBox.get("meditation_data");
      
      List<Map<String, dynamic>> meditationList = [];

      if(allMeditation != null && allMeditation is List){
        meditationList = List<Map<String, dynamic>>.from(allMeditation.map((meditation) => Map<String, dynamic>.from(meditation)));
      }
      meditationList.add(meditation.toJson());

      await meditationBox.put("meditation_data", meditationList);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Meditation added!"),
          duration: Duration(seconds: 2),
          )
      );
    }catch(error){
      print("Service Error : $error");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to add new Meditation!"),
          duration: Duration(seconds: 2),
          )
      );
    }
  }
}
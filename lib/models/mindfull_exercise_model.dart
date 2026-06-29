import 'package:hive_flutter/adapters.dart';
part 'mindfull_exercise_model.g.dart';

@HiveType(typeId: 1)
class MindFulnessExercise{

    @HiveField(0)//rows in boxes
    final String category;

    @HiveField(1)
    final String name;

    @HiveField(2)
    final String description;

    @HiveField(3)
    final List<String> instructions;

    @HiveField(4)
    final int duration;

    @HiveField(5)
    final String instructionsUrl;

    @HiveField(6)
    final String imagePath;

  MindFulnessExercise({
    required this.category, 
    required this.name, 
    required this.description, 
    required this.instructions, 
    required this.duration, 
    required this.instructionsUrl, 
    required this.imagePath
    });

    //method to convert the json data in to a MindfulnessExercise
    factory MindFulnessExercise.fromJson(Map<String, dynamic> json){
      return MindFulnessExercise(
        category: json['category'], 
        name: json['name'], 
        description: json['description'], 
        instructions: List<String>.from(json['instructions']), 
        duration: json['duration'], 
        instructionsUrl: json['instruction_url'], 
        imagePath: json['image_path']
        );
    }

    //convert MindFulnessExercise to json data
    Map<String, dynamic> toJson(){
      return {
        'category' : category,
        'name' : name,
        'description' : description,
        'instructions' : instructions,
        'duration' : duration,
        'instruction_url' : instructionsUrl,
        'image_path' : imagePath
      };

    }

    
}
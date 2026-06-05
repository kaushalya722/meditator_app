class MindFulnessExercise{
    final String category;
    final String name;
    final String description;
    final List<String> instructions;
    final int duration;
    final String instructionUrl;
    final String imagePath;

  MindFulnessExercise({
    required this.category, 
    required this.name, 
    required this.description, 
    required this.instructions, 
    required this.duration, 
    required this.instructionUrl, 
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
        instructionUrl: json['instruction_url'], 
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
        'instruction_url' : instructionUrl,
        'image_path' : imagePath
      };

    }

    
}
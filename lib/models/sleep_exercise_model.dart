class SleepExercise {
  final String category;
  final String name;
  final String description;
  final int duration;
  final String audioUrl;

  SleepExercise({
    required this.category, 
    required this.name, 
    required this.description, 
    required this.duration, 
    required this.audioUrl
    });

    //method to convert the json data in to a MeditationExercise
    factory SleepExercise.fromJson(Map<String, dynamic> json){
      return SleepExercise(
        category: json['category'], 
        name: json['name'], 
        description: json['description'], 
        duration: json['duration'], 
        audioUrl: json['audio_url']
        );
    }

     //convert MeditationExercise to json data
     Map<String, dynamic> toJson() {
      return {
        'category' : category,
        'name' : name,
        'description' : description,
        'duration' : duration,
        'audio_url' : audioUrl,
      };
     }


}
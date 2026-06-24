import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_style.dart';

class MindfullExerciseTimer extends StatelessWidget {
  final MindFulnessExercise mindfullExercise;

  const MindfullExerciseTimer({super.key, required this.mindfullExercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mindfullExercise.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mindfullExercise.category, style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryGreen,
              ),
              ),
              const SizedBox(height: 10,),
              Text(mindfullExercise.name,
              style: AppTextStyles.titleStyle,
              ),
              const SizedBox(height: 10,),
              Text("Duration : ${mindfullExercise.duration} min",
              style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(height: 20,),
              Text(mindfullExercise.description,
              style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(height: 20,),
              Text("Instructions",
              style: AppTextStyles.bodyStyle,
              ),
              const SizedBox(height: 10,),
              ...mindfullExercise.instructions.map((instruction) => Padding(
                padding: EdgeInsets.symmetric(vertical: 5,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primaryGreen.withOpacity(0.5)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text(instruction, style: TextStyle(
                      fontSize: 15
                    ),),
                  ),
                ),
                ),
                ), 
            ],
          ),
        ),
      ),
    );
  }
}
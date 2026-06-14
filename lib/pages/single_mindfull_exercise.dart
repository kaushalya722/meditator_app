import 'package:flutter/material.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class SingleMindfullExercisePage extends StatelessWidget {
  final MindFulnessExercise mindfullnessExercise;
  const SingleMindfullExercisePage({
    super.key, 
    required this.mindfullnessExercise});

    Future <void> _launchUrl(String url) async {
      final Uri uri = Uri.parse(url);
      if(await canLaunchUrl(uri)) {
        await launchUrl(uri);
      }else{
        throw "Could not launch $url";
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mindfull Exercise Details", style: TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryPurple,
        ),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mindfullnessExercise.name, style: AppTextStyles.titleStyle,),
                const SizedBox(height: 10,),
                Text(mindfullnessExercise.category),
                 const SizedBox(height: 20,),
                 Text(mindfullnessExercise.description),
                 const SizedBox(height: 20,),
                 Text("Instructions"),
                 const SizedBox(height: 20,),
                 ...mindfullnessExercise.instructions.map(
                  (instruction) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.circle, size: 8,),
                        const SizedBox(width: 8,),
                        Expanded(
                          child: Text(instruction)),
                      ],
                    ),
                    
                    ),
                    
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        const Icon(Icons.timer, color: AppColors.primaryGrey,),
                        const SizedBox(width: 8,),
                        Text("${mindfullnessExercise.duration} min"),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(onPressed: () async {
                      await _launchUrl(mindfullnessExercise.instructionsUrl);
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryGreen),
                    ),
                     child: Text("View Detailed Instructions", style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
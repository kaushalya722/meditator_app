import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/meditation_form.dart';
import 'package:meditator_app/widgets/mindfulness_form.dart';
import 'package:meditator_app/widgets/sleep_exercise_form.dart';

class CreateExercisePage extends StatefulWidget {
  const CreateExercisePage({super.key});

  @override
  State<CreateExercisePage> createState() => _CreateExercisePageState();
}

class _CreateExercisePageState extends State<CreateExercisePage> {
  String typeOfContent = "Meditation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Custom Exercise", style: const TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryPurple
        ),),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryPurple.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: AppColors.primaryPurple,
                    )
                  ),
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: typeOfContent,
                      icon:  Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryPurple,
                        ),
                        isExpanded: true,
                        items: ["Meditation", "Sleep", "Mindfulness"].map((item){
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item, style: TextStyle(
                              fontSize: 16,
                              color: AppColors.primaryDarkBlue
                            ),),
                            );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            typeOfContent = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20,),
              if(typeOfContent == "Meditation")
              MeditationForm()
              else if(typeOfContent == "Sleep")
              SleepExerciseForm()
              else if(typeOfContent == "Mindfulness")
              MindfullExerciseForm()
              
            ],
          ),
        ),
      )),
    );
  }
}
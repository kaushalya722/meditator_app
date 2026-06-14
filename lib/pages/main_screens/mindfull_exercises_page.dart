import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditator_app/models/mindfull_exercise_model.dart';
import 'package:meditator_app/providers/mindfull_exercise_provider.dart';
import 'package:meditator_app/routers/route_names.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/utils/text_style.dart';
import 'package:provider/provider.dart';

class MindfullExercisePage extends StatelessWidget {
  const MindfullExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mindfull Exercises", style: TextStyle(
          fontSize: 29,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryPurple,
        ),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.primaryPurple,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  onChanged: (value) {
                    Provider.of<MindfullExerciseProvider>(context, listen: false).searchMindfullExercise(value);
                  },
                ),
                const SizedBox(height: 10,),
                Consumer<MindfullExerciseProvider>(builder: (context, mindfullExercise, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: mindfullExercise.mindfullExercise.length,
                    itemBuilder: (context, index) {
                       MindFulnessExercise singleMindfullExercise = mindfullExercise.mindfullExercise[index];

                       return GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pushNamed(
                            RoutesNames.mindfullExercise,
                            queryParameters: {
                              "mindfullExercise": jsonEncode(singleMindfullExercise.toJson()),
                            }
                          );
                        },
                         child: Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                           decoration: BoxDecoration(
                            color: AppColors.primaryDarkBlue.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                            
                           ),
                           child: ListTile(
                             leading: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(singleMindfullExercise.imagePath,
                              width: MediaQuery.of(context).size.width * 0.13,
                              height: MediaQuery.of(context).size.width * 0.13,
                              fit: BoxFit.cover,
                              ),
                             ),
                             title: Text(singleMindfullExercise.name, style: AppTextStyles.subtitleStyle,),
                             subtitle: Text(singleMindfullExercise.description,
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style: AppTextStyles.bodyStyle.copyWith(
                              color: AppColors.primaryDarkBlue.withOpacity(0.7),
                              fontSize: 14,
                             ),
                             ),
                            
                           ),
                         ),
                       );
                  },
                  );
                },)
              ],
            ),
          ),
        )
      ),
    );
  }
}
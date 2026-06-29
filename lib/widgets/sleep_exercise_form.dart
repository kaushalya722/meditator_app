import 'package:flutter/material.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/reusable/text_input.dart';

class SleepExerciseForm extends StatefulWidget {
  const SleepExerciseForm({super.key});

  @override
  State<SleepExerciseForm> createState() => _SleepExerciseFormState();
}

class _SleepExerciseFormState extends State<SleepExerciseForm> {

final _formKey = GlobalKey<FormState>();

String _category = "";
String _name = "";
String _description = "";
int _duration = 0;
String _audioUrl = "";


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: _formKey,
            child: Column(
            children: [
              Text("Create a new Sleep Exercise", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGreen,
              ),
              ),
              const SizedBox(height: 30,),
              CustomTextFormFeild(
                lableText: "Category", 
                keyBoardType: TextInputType.text,
                hintText: "Category",
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Category";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _category = newValue!;
                },
                ),
               const SizedBox(height: 10,),
              CustomTextFormFeild(
                lableText: "Name", 
                keyBoardType: TextInputType.text,
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Name";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _name = newValue!;
                },
                ),
      
                const SizedBox(height: 10,),
              CustomTextFormFeild(
                lableText: "Description", 
                keyBoardType: TextInputType.text,
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Description";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _description = newValue!;
                },
                ),
      
              const SizedBox(height: 10,),
              CustomTextFormFeild(
                lableText: "Duration", 
                keyBoardType: TextInputType.number,
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Duration";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _duration = int.parse(newValue!);
                },
                ),
      
      
               const SizedBox(height: 10,),
              CustomTextFormFeild(
                lableText: "Audio Url", 
                keyBoardType: TextInputType.text,
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Audio Url";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _audioUrl = newValue!;
                },
                ),
      
                 const SizedBox(height: 30,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     ElevatedButton(
                      //todo: onpressed
                      onPressed: () {}, 
                      style: ButtonStyle(
                        backgroundColor:WidgetStateProperty.all<Color>(
                          AppColors.primaryGreen,
                        ),
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          )
                        )
                      ),
                      child: Text("Submit", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),),
                      ),
                   ],
                 ),
                  
            ],
          ),
          ),
        ],
      ),
    );
  }
}
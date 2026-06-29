import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:meditator_app/widgets/reusable/text_input.dart';

class MindfullExerciseForm extends StatefulWidget {
  const MindfullExerciseForm({super.key});

  @override
  State<MindfullExerciseForm> createState() => _MindfullExerciseFormState();
}

class _MindfullExerciseFormState extends State<MindfullExerciseForm> {

  final _formKey = GlobalKey<FormState>();

String _category = "";
String _name = "";
String _description = "";
List<String> _instructions = [];
int _duration = 0;
File? _imagePath;
String _instructionsUrl = "";


final ImagePicker _imagePicker = ImagePicker();

Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await _imagePicker.pickImage(source: source);

  setState(() {
    if(pickedFile != null){
      _imagePath = File(pickedFile.path);
    }else{
      print("No image selected");
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Create a new meditation", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryGreen,
              ),
              ),
               const SizedBox(height: 30,),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    if(_imagePath != null)
                    Image.file(_imagePath!, height: 200,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         ElevatedButton(
                          onPressed: () => _pickImage(ImageSource.camera), 
                          child: Text("Pick from Camera"),
                          ),
                          ElevatedButton(
                          onPressed: () => _pickImage(ImageSource.gallery), 
                          child: Text("Pick from Gallery"),
                          ),
                      ],
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
                  ],
                ),
                ),
                const SizedBox(height: 10,),
              CustomTextFormFeild(
                lableText: "Instructions", 
                keyBoardType: TextInputType.text,
                hintText: "Instructions",
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Instructions";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _instructions = newValue!.split(',');
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
                lableText: "Instruction Url", 
                keyBoardType: TextInputType.text,
                validator: (value){
                  if(value == null || value.isEmpty){
                     return "Please Enter a Instruction Url";
                  }
                  return null;
                } ,
                onSaved: (newValue) {
                  _instructionsUrl = newValue!;
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
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meditator_app/models/sleep_exercise_model.dart';
import 'package:meditator_app/utils/colors.dart';
import 'package:provider/provider.dart';

class SleepExerciseTimerPage extends StatefulWidget {
  final SleepExercise sleepExercise;
  const SleepExerciseTimerPage({super.key, required this.sleepExercise});

  @override
  State<SleepExerciseTimerPage> createState() => _SleepExerciseTimerPageState();
}

class _SleepExerciseTimerPageState extends State<SleepExerciseTimerPage> {

  Timer? _timer;
  int _remainingTime = 0;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.sleepExercise.duration * 60;
  }

//method to start the timer
void _startTimer(){
  if(_timer != null){
    _timer!.cancel();
  }
  _isRunning = true;
  _timer = Timer.periodic(const Duration(seconds: 1), (timer){
    setState(() {
      if(_remainingTime > 0){
        _remainingTime --;
      }else{
        _timer!.cancel();
      }
    });
  });
}

//method to post timer
void _pauseTimer(){
  if(_timer != null){
    _timer!.cancel();//pause
    _isRunning = false;
  }
}

//method to stop a timer
void _stopTimer(){
  if(_timer != null){
    _timer!.cancel();
    setState(() {
      _remainingTime = widget.sleepExercise.duration * 60;
      _isRunning = false;
    });
  }
}


String _formatTime (int seconds){
  final int minutes = seconds ~/ 60; //convert the dounble value into int (turncated division operator)
  final int remainingSeconds = seconds % 60;
  return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
}

@override
  void dispose() {
    if(_timer != null){
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sleep Story Timer"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                widget.sleepExercise.category,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryPurple,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.sleepExercise.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Duration: ${widget.sleepExercise.duration} minutes',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                widget.sleepExercise.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: Text(_formatTime(_remainingTime), style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isRunning ? _pauseTimer() : _startTimer();
                  });
                }, 
                child: Text(
                  _isRunning 
                  ? "Pause" 
                  : (_remainingTime < widget.sleepExercise.duration * 60 
                  ? "Resume"
                  : "Start"
                  ),
                ),
                ),
                const SizedBox(width: 10,),
                ElevatedButton(
                  onPressed: _stopTimer, 
                  child: Text("Stop"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
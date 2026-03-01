import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  // get the box
  final _myBox = Hive.box('myBox');

  // text controller
  final _textController = TextEditingController();

  // list of exercises
  List<String> exercises = [];


  @override
  void initState() {
    // load data, if none, empty list
    exercises = _myBox.get("Excercise_List") ?? [];

    super.initState();
  }

  // open new exercise dialog
  void openNewExercise() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add New Exercise"),
        content: TextField(
          controller: _textController,
          decoration: const InputDecoration(hintText: "Exercise Name"),
        ),

        actions: [

          //cancel button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _textController.clear();
            }, 
            child: const Text("Cancel")
            ),

          //add button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              addNewExercise();
            }, 
            child: const Text("Add")
          )
        ],
      )
    );
  }

  // add new exercise
  void addNewExercise() {
    String exerciseName = _textController.text;
    setState(() {
      exercises.add(exerciseName);
      _textController.clear();

    });

  }
  // delete exercise

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // add exercise button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openNewExercise,
        label: const Text("Add Exercise"),
        icon: const Icon(Icons.add),
      ),


      // show list of exercises
        body: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            // get each exercise
            final exercise = exercises[index];
            return ListTile(
              title: Text(exercise),
            );
          },
        ),
    );
  }
}
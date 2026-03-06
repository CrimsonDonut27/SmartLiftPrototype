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

      backgroundColor: const Color.fromARGB(255, 31, 31, 31),
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(255, 13, 13, 13),
        leading: Icon(Icons.fitness_center, color: Colors.white),
        title: const Text("Hello, {username}!", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),  
      // add Day button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: openNewExercise,
        label: const Text("Add Day"),
        icon: const Icon(Icons.add),
      ),

        
      // show containers just below AppBar
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 360.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.circular(16.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'your progress',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  const Spacer(),
                  const Text(
                    'compared to last month',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  const Spacer(),
                  Text(
                    // current date
                    DateTime.now().toLocal().toString().split(' ')[0],
                    style: const TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Secondary',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8.0),
                Container(
                  width: 200.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Tertiary',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
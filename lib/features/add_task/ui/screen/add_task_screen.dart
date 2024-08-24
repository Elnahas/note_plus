import 'package:flutter/material.dart';
import 'package:note_plus/core/helpers/extentions.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Add Task" , style: Theme.of(context).textTheme.displayLarge,),
        centerTitle: false,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined ,),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Center(child: Text("Add Task"),),
    );
  }
}
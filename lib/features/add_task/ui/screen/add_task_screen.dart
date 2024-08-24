import 'package:flutter/material.dart';
import 'package:note_plus/core/helpers/app_string.dart';
import 'package:note_plus/core/helpers/extentions.dart';
import 'package:note_plus/core/helpers/spacing.dart';
import 'package:note_plus/core/widgets/app_text_form_field.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            verticalSpace(48),
            AppTextFormField(labelText: AppString.title,hintText: AppString.enterTitleHere, validator: (p0) {
              
            },)
          ],
        ),
      ),
    );
  }
}
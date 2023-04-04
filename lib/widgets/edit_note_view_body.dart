import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 70,),
          CustomAppBar(title:'Edit Note',iconData: Icons.check,),
          SizedBox(height: 50,),
          CustomTextField(hint: 'Title',),
          SizedBox(height: 16,),
          CustomTextField(hint: 'Content',maxLines: 5,),
        ],
      ),
    );
  }
}

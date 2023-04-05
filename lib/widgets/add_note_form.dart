import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey= GlobalKey();
  AutovalidateMode autoValidateMode =AutovalidateMode.disabled;
  String? title ,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children:  [
          const SizedBox(height: 32,),
          CustomTextField(hint: 'Title',onSaved: (value)
          {
            title=value;
          },),
          const SizedBox(height: 16,),
          CustomTextField(hint: 'Content',maxLines: 5,onSaved: (value)
          {
            subTitle=value;
          },),
          const SizedBox(height: 64,),
          CustomButton(onTap: ()
          {
            if(formKey.currentState!.validate())
            {
              formKey.currentState!.save();
            }
            else{
              autoValidateMode=AutovalidateMode.always;
              setState(() {

              });
            }
          },),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}



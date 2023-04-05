import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/colors_list_view.dart';
import 'package:notes_app/widgets/custom_botton.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({Key? key}) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32,),
          CustomTextField(hint: 'Title', onSaved: (value) {
            title = value;
          },),
          const SizedBox(height: 16,),
          CustomTextField(hint: 'Content', maxLines: 5, onSaved: (value) {
            subTitle = value;
          },),
          const SizedBox(height: 32,),
          ColorsListView(),
          const SizedBox(height: 32,),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate=DateTime.now();
                    var formattedCurrentDate = DateFormat('dd-mm-yyyy').format(currentDate);
                    var notemodel = NoteModel(title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  }
                  else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {

                    });
                  }
                },);
            },
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}



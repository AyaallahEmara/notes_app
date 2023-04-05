import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_note/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_app_bar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({Key? key,required this.noteModel}) : super(key: key);
  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 70,),
          CustomAppBar(onPressed:(){
              widget.noteModel.title=title ?? widget.noteModel.title;
              widget.noteModel.subTitle=subTitle ?? widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
          },title:'Edit Note',iconData: Icons.check,),
          SizedBox(height: 50,),
          CustomTextField(hint: widget.noteModel.title,onChanged: (value)
            {
              title=value;
            },),
          SizedBox(height: 16,),
          CustomTextField(hint: widget.noteModel.subTitle,maxLines: 5,onChanged: (value)
            {
              subTitle=value;
            },),
        ],
      ),
    );
  }
}

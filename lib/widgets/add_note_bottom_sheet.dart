import 'package:flutter/material.dart';
import 'package:notes_app/cubits/add_note/add_note_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class AddNoteBottomSheet extends StatelessWidget {
   const AddNoteBottomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16),

          child: BlocConsumer<AddNoteCubit,AddNoteState>(
      builder: ( context, state) {
        return ModalProgressHUD(inAsyncCall: state is AddNoteLoading ? true : false,
        child: SingleChildScrollView(child: AddNoteForm()));
        },
          listener: ( context,  state) {
          if (state is AddNoteFailure)
            {
              print('Failed ${state.errorMessage}');
            }
          if((state is AddNoteSuccess))
            {
            Navigator.pop(context);
            }
          },

        ),

      ),
    );
  }
}


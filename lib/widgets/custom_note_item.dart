import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_note_view.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({Key? key, required this.noteModel}) : super(key: key);
 final NoteModel noteModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16,),
        decoration: BoxDecoration(
           color:  Color(noteModel.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(noteModel.title,style: TextStyle(
                color: Colors.black,
                fontSize: 26,
              ),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(noteModel.subTitle,style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                  fontSize: 18,
                ),),
              ),
              trailing: IconButton(onPressed: () {  }, icon: Icon(Icons.delete,
              color: Colors.black,
              size: 30,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(noteModel.date,style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(.4),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

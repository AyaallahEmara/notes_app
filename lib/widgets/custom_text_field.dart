import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.hint,   this.maxLines=1, this.onSaved, this.onChanged}) : super(key: key);
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value)
      {
        if(value?.isEmpty ?? true)
          {
            return 'Field is required';
          }
        else{
          return null;
        }
      },
      onChanged: onChanged,
      onSaved: onSaved,
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration:InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: kPrimaryColor),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide:  BorderSide(color: color ?? Colors.white),
      );
  }
}

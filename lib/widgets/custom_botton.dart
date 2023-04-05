import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap,  this.isLoading=false}) : super(key: key);
   final void Function()? onTap;
   final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: isLoading ? SizedBox(height: 24,width: 24,
              child: CircularProgressIndicator(color: Colors.black,)) : Text('Add',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black),),
        ),
      ),
    );
  }
}




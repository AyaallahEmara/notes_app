import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.iconData, this.onPressed}) : super(key: key);
   final String title;
   final IconData iconData;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,style: TextStyle(
          fontSize: 28,
        ),),
        Spacer(),
        CustomSearchIcon(icon: iconData,onPressed: onPressed,),
      ],
    );
  }
}




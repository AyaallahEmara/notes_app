import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({Key? key, required this.isActive, required this.color}) : super(key: key);
  final bool isActive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive ? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 38,
      child: CircleAvatar(
        radius: 34,
        backgroundColor: color,
      ),
    ) :CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({Key? key}) : super(key: key);

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0 ;
  List<Color> colors = [Color(0xFFDFD9E2),
    Color(0xFFC3ACCE),
    Color(0xFF89909F),
    Color(0xFF538083),
    Color(0xFF2A7F62)];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ( context,  index)
        {
          return  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: ()
                {
                  currentIndex=index;
                  setState(() {

                  });
                },
                child: ColorItem(isActive: currentIndex == index ,color: colors[index],)),
          );
        },

      ),
    );
  }
}

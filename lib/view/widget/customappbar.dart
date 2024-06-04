import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String hintTitle;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController mycontroller;

  const CustomAppBar({
    super.key,
    required this.hintTitle,
    required this.onPressedIcon,
    required this.onPressedSearch,
    required this.onChanged,
    required this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 10),
      //padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
              //height: 12,
              child: Container(
            height: 65,
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefix: IconButton(
                    icon:const Icon(Icons.search),
                    onPressed: onPressedSearch,
                  ),
                  hintText: hintTitle,
                  hintStyle:const TextStyle(fontSize: 18),
                  filled: true,
                  fillColor: Colors.grey[200]),
              controller: mycontroller,
            ),
          )),
        const  SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            width: 60,
            padding:const EdgeInsets.symmetric(vertical: 8),
            child: IconButton(
                onPressed: onPressedIcon,
                icon:const Icon(
                  //Icons.notifications_active_outlined
                  Icons.airplanemode_active,
                  size: 30,
                )),
          ),
        ],
      ),
    );
  }
}

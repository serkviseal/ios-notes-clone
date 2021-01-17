import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/utils/styles.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key key,
    @required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      textInputAction: TextInputAction.search,
      onChanged: (text) {
        print("//TODO: searched item");
      },
      placeholder: "Search",
      cursorHeight: 22,
      cursorColor: CustomColors.yellow,
      style: TextStyle(color: Colors.black),
      controller: _controller,
      decoration: BoxDecoration(
        color: Colors.blueGrey[200].withOpacity(0.30),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(8),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(
          Ionicons.search,
          size: 22,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}

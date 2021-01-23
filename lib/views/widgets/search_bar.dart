import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/utils/styles.dart';

class Searchbar extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode focusNode;
  final Function onTyped, onSubmitted;
  const Searchbar(
      {Key key,
      this.onSubmitted,
      this.onTyped,
      @required TextEditingController controller,
      @required this.focusNode})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      focusNode: this.focusNode,
      textInputAction: TextInputAction.search,
      onChanged: (text) => this.onTyped(text),
      onSubmitted: (text) => this.onSubmitted(text),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/utils/styles.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: kBottomNavigationBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        border: Border(
          top: BorderSide(color: Colors.grey[400]),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomIconButton(
            icon: Icon(
              CupertinoIcons.folder_badge_plus,
              color: CustomColors.yellow,
              size: 28,
            ),
            onPressed: () => print("//TODO: create folder"),
          ),
          CustomIconButton(
            icon: Icon(
              Ionicons.create_outline,
              size: 28,
              color: CustomColors.yellow,
            ),
            onPressed: () => print("//TODO: create note"),
          )
        ],
      ),
    );
  }
}

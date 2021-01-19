import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/utils/styles.dart';

class BottomBar extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final List<CustomIconButton> items;
  const BottomBar({
    this.mainAxisAlignment,
    @required this.items,
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
        mainAxisAlignment:
            this.mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: this.items,
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

Widget removeRipple(Widget widget) => Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: widget,
    );

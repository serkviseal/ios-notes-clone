import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/views/widgets/folder_tile.dart';

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

Widget removeRipple(Widget widget) => Theme(
      data: ThemeData(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: widget,
    );

List<Folder> defaultFolders(int notesCount) => [
      Folder(name: "Notes", notes: []),
      Folder(name: "Recently Deleted", notes: []),
    ];

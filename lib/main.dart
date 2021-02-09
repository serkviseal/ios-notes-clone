import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paper/utils/styles.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

import 'core/models/folder.dart';
import 'core/models/note.dart';
import 'views/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocsDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocsDir.path);
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(FolderAdapter());
  await Hive.openBox('folders');
  Hive.box('folders').put("notes", Folder(name: "Notes", notes: []));
  Hive.box('folders').put("trash", Folder(name: "Recently Deleted", notes: []));
  runApp(ProviderScope(child: Paper()));
}

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      color: CustomColors.yellow,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: CustomColors.yellow,
        primaryContrastingColor: CustomColors.yellow,
        textTheme: CupertinoTextThemeData(
          primaryColor: CustomColors.yellow,
          textStyle:
              !Platform.isIOS ? TextStyle(fontFamily: 'SanFrancisco') : null,
        ),
      ),
    );
  }
}

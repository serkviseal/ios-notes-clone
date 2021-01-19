import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  await Hive.openBox('notes');
  await Hive.openBox('folders');
  runApp(ProviderScope(child: Paper()));
}

class Paper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          textStyle:
              !Platform.isIOS ? TextStyle(fontFamily: 'SanFrancisco') : null,
        ),
      ),
    );
  }
}

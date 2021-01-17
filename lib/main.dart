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
  runApp(ProviderScope(child: Paper()));
}

class Paper extends StatelessWidget {
  Future<void> openBoxes() async {
    Hive.openBox('notes');
    Hive.openBox('folders');
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
          future: openBoxes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done)
              return HomeScreen();
            else
              return CupertinoPageScaffold(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Image.asset('assets/images/logo.png',
                        fit: BoxFit.contain),
                  ),
                ),
              );
          }),
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
          textStyle:
              !Platform.isIOS ? TextStyle(fontFamily: 'SanFrancisco') : null,
        ),
      ),
    );
  }
}

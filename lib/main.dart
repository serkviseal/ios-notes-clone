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
        // Adding MaterialLocalizations cause flutter_quill pkg depends on them.
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      color: CupertinoColors.systemOrange,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: CupertinoThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: CupertinoColors.systemOrange,
        primaryContrastingColor: CupertinoColors.systemOrange,
        textTheme: CupertinoTextThemeData(
            primaryColor: CupertinoColors.systemOrange,
            textStyle: !Platform.isIOS
                ? DefaultTextStyle.of(context)
                    .style
                    .copyWith(fontFamily: 'SanFrancisco')
                : DefaultTextStyle.of(context).style),
        //SanFrancisco is the default font on iOS and it is a better quality.
      ),
    );
  }
}

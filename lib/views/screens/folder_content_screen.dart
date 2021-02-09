import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/views/screens/editor_screen.dart';
import 'package:paper/views/widgets/bottom_bar.dart';
import 'package:paper/extensions/string_extension.dart';

class FolderContentScreen extends HookWidget {
  final String previousScreenTitle;
  final Folder folder;
  const FolderContentScreen({
    @required this.folder,
    @required this.previousScreenTitle,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: this.folder.name,
      previousPageTitle: this.previousScreenTitle,
      trailing: CustomIconButton(
        icon: Icon(CupertinoIcons.ellipsis_circle, size: 24),
        onPressed: () => print("//TODO: More"),
      ),
      bottomNavigationBar: BottomBar(
        items: [
          Container(),
          Text(folder.notes.length > 0 ? "${folder.notes.length}" : "No Notes"),
          CustomIconButton(
            icon: Icon(
              Ionicons.create_outline,
              size: 28,
              color: CustomColors.yellow,
            ),
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => EditorScreen(
                  previousTitle: "${folder.name}".shorten(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomScaffold extends StatelessWidget {
  final Color backgroundColor;
  final BottomBar bottomNavigationBar;
  final String title, previousPageTitle;
  final Widget trailing;
  final List<Widget> slivers;

  const CustomScaffold({
    @required this.title,
    this.previousPageTitle,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.trailing,
    this.slivers,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this.backgroundColor ?? Colors.grey[300],
      bottomNavigationBar: this.bottomNavigationBar,
      body: CustomScrollView(
        slivers: [
          //TODO: add Slivers attribute without removing CupertinoSliverNavigationBar
          CupertinoSliverNavigationBar(
            automaticallyImplyTitle: true,
            actionsForegroundColor: CustomColors.yellow,
            previousPageTitle: this.previousPageTitle,
            automaticallyImplyLeading: true,
            backgroundColor: this.backgroundColor ?? Colors.grey[300],
            largeTitle: Text(this.title),
            trailing: this.trailing,
          ),
        ],
      ),
    );
  }
}

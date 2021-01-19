import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/views/widgets/bottom_bar.dart';

class FolderContentScreen extends HookWidget {
  final String title;
  const FolderContentScreen({@required this.title});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: this.title,
      bottomNavigationBar: BottomBar(
        axisAlignment: MainAxisAlignment.end,
        items: [
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

class CustomScaffold extends StatelessWidget {
  final Color backgroundColor;
  final BottomBar bottomNavigationBar;
  final String title;
  final Widget trailing;
  final List<Widget> slivers;

  const CustomScaffold({
    @required this.title,
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
            backgroundColor: this.backgroundColor ?? Colors.grey[300],
            largeTitle: Text(this.title),
            trailing: this.trailing,
          ),
        ],
      ),
    );
  }
}

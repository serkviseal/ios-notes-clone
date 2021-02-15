import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paper/core/hooks/editor_hook.dart';
import 'package:paper/utils/styles.dart';

import 'package:paper/views/widgets/note_more_actions_bottom_sheet.dart';

class EditorScreen extends HookWidget {
  final String previousTitle;
  const EditorScreen({@required this.previousTitle});

  @override
  Widget build(BuildContext context) {
    final _editor = useQuillEditor();

    return CupertinoPageScaffold(
      backgroundColor: Colors.grey[50],
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: this.previousTitle,
        trailing: SizedBox(
          width: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                icon: Icon(CupertinoIcons.ellipsis_circle, size: 24),
                onPressed: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return NoteActionsBottomSheet();
                    }),
              ),
              Text(
                "Done",
                style: CupertinoTheme.of(context).textTheme.actionTextStyle,
              )
            ],
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          child: Material(child: _editor),
          padding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}

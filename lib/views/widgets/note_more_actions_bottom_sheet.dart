import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:paper/extensions/string_extension.dart';

import 'note_action_button.dart';

class NoteMoreActionsBottomSheet extends StatelessWidget {
  const NoteMoreActionsBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.lightBackgroundGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              padding: EdgeInsets.only(
                left: 12,
                right: 12,
                top: 6,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "Note".shorten(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    mini: true,
                    elevation: 0,
                    isExtended: false,
                    onPressed: () => Navigator.pop(context),
                    backgroundColor: CupertinoColors.systemGrey4,
                    child: Icon(
                      Ionicons.close,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: CupertinoColors.opaqueSeparator,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              width: double.infinity,
              child: Row(
                children: [
                  Flexible(
                    child: NoteActionButton(
                      text: "Scan",
                      icon: CupertinoIcons.doc_text_viewfinder,
                      childrenColor: CupertinoColors.activeBlue,
                    ),
                  ),
                  Flexible(
                    child: NoteActionButton(
                      text: "Pin",
                      icon: CupertinoIcons.pin_fill,
                      childrenColor: CupertinoColors.activeOrange,
                    ),
                  ),
                  Flexible(
                    child: NoteActionButton(
                      text: "Lock",
                      icon: CupertinoIcons.lock_fill,
                      childrenColor: CupertinoColors.systemPurple,
                    ),
                  ),
                  Flexible(
                    child: NoteActionButton(
                      text: "Delete",
                      icon: CupertinoIcons.trash_fill,
                      childrenColor: CupertinoColors.systemRed,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import 'package:paper/extensions/string_extension.dart';
import 'package:paper/views/widgets/folder_tile.dart';

import 'note_action_button.dart';

class NoteActionsBottomSheet extends StatelessWidget {
  const NoteActionsBottomSheet({
    Key key,
  }) : super(key: key);

//FIXME: Can't exit the sheet by clicking on the empty space above.
//FIXME: Can't scroll up by dragging [SheetHead()] but can scroll down.
//TODO: Add keys to the ActionButtons.

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.2,
      initialChildSize: 0.55,
      maxChildSize: 0.85,
      builder: (context, _) => Container(
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
            SheetHead(),
            Divider(
              height: 0,
              color: CupertinoColors.opaqueSeparator,
            ),
            Flexible(
              child: ListView(
                controller: _,
                children: [
                  ActionButtonsRow(),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 12,
                      left: 12,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.extraLightBackgroundGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: CustomListTile(
                      title: Text("Send a Copy"),
                      leadingWidth: 5,
                      trailing: Icon(
                        CupertinoIcons.square_arrow_up,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 12,
                      right: 12,
                    ),
                    decoration: BoxDecoration(
                      color: CupertinoColors.extraLightBackgroundGray,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        CustomListTile(
                          leadingWidth: 5,
                          title: Text("Find in Note"),
                          trailing: Icon(
                            CupertinoIcons.search,
                            color: CupertinoColors.black,
                          ),
                        ),
                        Divider(
                          color: CupertinoColors.opaqueSeparator,
                          thickness: 1 / 2,
                          height: 0,
                        ),
                        CustomListTile(
                          leadingWidth: 5,
                          title: Text("Move Note"),
                          trailing: Icon(
                            CupertinoIcons.folder,
                            color: CupertinoColors.black,
                          ),
                        ),
                        Divider(
                          color: CupertinoColors.opaqueSeparator,
                          thickness: 1 / 2,
                          height: 0,
                        ),
                        CustomListTile(
                          leadingWidth: 5,
                          title: Text("Lines & Grids"),
                          trailing: Icon(
                            CupertinoIcons.table,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActionButtonsRow extends StatelessWidget {
  const ActionButtonsRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class SheetHead extends StatelessWidget {
  const SheetHead({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

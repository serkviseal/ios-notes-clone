import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/views/screens/folder_content_screen.dart';

import 'folder_tile.dart';

Container buildFoldersList({
  IconData dropdownIconState,
  @required List<Folder> folders,
}) {
  return dropdownIconState != CupertinoIcons.chevron_down
      ? Container()
      : Container(
          height: 52 * folders.length.toDouble(),
          margin: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Divider(
              color: Colors.grey[500],
              indent: 65,
            ),
            itemCount: folders.length,
            itemBuilder: (context, index) {
              var folder = folders[index];
              return GestureDetector(
                key: Key("$index"),
                onTap: () => Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        FolderContentScreen(title: folder.name),
                  ),
                ),
                child: FolderTile(
                  folderName: folder.name,
                  notesCount: folder.notes.length,
                  icon: folder.name == 'Recently Deleted'
                      ? CupertinoIcons.trash
                      : null,
                ),
              );
            },
          ),
        );
}

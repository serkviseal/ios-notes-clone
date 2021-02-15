import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/views/screens/folder_content_screen.dart';

import 'folder_tile.dart';

class FoldersList extends StatelessWidget {
  final String pageTitle;
  final IconData dropdownIcon;
  final List<Folder> folders;

  const FoldersList({
    @required this.pageTitle,
    this.dropdownIcon,
    @required this.folders,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return dropdownIcon != CupertinoIcons.chevron_down
        ? Container()
        : Container(
            height: 62 * folders.length.toDouble(),
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
                height: 0,
              ),
              itemCount: folders.length,
              itemBuilder: (context, index) {
                var folder = folders[index];
                return FolderTile(
                  onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => FolderContentScreen(
                        folder: folder,
                        previousScreenTitle: pageTitle,
                      ),
                    ),
                  ),
                  key: Key(index.toString()),
                  folderName: folder.name,
                  notesCount: folder.notes.length,
                  icon: folder.name == 'Recently Deleted'
                      ? CupertinoIcons.trash
                      : null,
                );
              },
            ),
          );
  }
}

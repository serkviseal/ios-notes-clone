import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/utils/constants.dart';

class FolderTile extends StatelessWidget {
  final String folderName;
  final int notesCount;
  final IconData icon;
  final Function onPressed, onLongPress;
  const FolderTile({
    @required this.folderName,
    this.onLongPress,
    this.onPressed,
    this.notesCount = 0,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      key: this.key,
      onPressed: this.onPressed,
      onLongPress: this.onLongPress,
      title: Text(this.folderName),
      leading: Icon(
        this.icon ?? CupertinoIcons.folder,
        color: CupertinoColors.systemOrange,
      ),
      trailing: SizedBox(
        height: 14,
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "$notesCount",
            ),
            SizedBox(width: 5, height: 14),
            Icon(
              CupertinoIcons.chevron_right,
              size: 12,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final Function onPressed, onLongPress;
  final Widget leading, title, trailing;
  final EdgeInsetsGeometry contentPadding;
  final double leadingWidth, trailingWidth, height;
  final Color highlightColor, splashColor, backgroundColor;
  const CustomListTile({
    Key key,
    this.backgroundColor,
    this.onLongPress,
    this.onPressed,
    this.leading,
    this.title,
    this.trailing,
    this.contentPadding,
    this.leadingWidth,
    this.trailingWidth,
    this.highlightColor,
    this.splashColor,
    this.height = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: this.onLongPress,
      onTap: this.onPressed,
      child: Container(
        height: this.height,
        width: double.infinity,
        padding: this.contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 8,
            ),
        color: this.backgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: this.leading ?? SizedBox(width: 2),
              width: this.leadingWidth ?? 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 25,
                width: screenWidth(context) / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(child: this.title),
                  ],
                ),
              ),
            ),
            SizedBox(child: trailing, width: this.trailingWidth ?? 60)
          ],
        ),
      ),
    );
  }
}

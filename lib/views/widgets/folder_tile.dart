import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/utils/constants.dart';
import 'package:paper/utils/styles.dart';

class FolderTile extends StatelessWidget {
  final String folderName;
  final int notesCount;
  final IconData icon;
  const FolderTile({
    @required this.folderName,
    this.notesCount = 0,
    this.icon,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: Text(this.folderName),
      leading: Icon(
        this.icon ?? CupertinoIcons.folder,
        color: CustomColors.yellow,
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
  final double leadingWidth, trailingWidth;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: this.highlightColor ?? Colors.transparent,
      splashColor: this.splashColor ?? Colors.transparent,
      onLongPress: this.onLongPress,
      onTap: this.onPressed,
      child: Container(
        height: 35,
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
              child: this.leading,
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

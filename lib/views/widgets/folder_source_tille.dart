import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paper/utils/styles.dart';

class FoldersSourceTile extends StatelessWidget {
  final String header;
  final Function onTap;
  final Widget trailing;

  const FoldersSourceTile({
    Key key,
    @required this.trailing,
    @required this.header,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      focusColor: Colors.transparent,
      selectedTileColor: Colors.transparent,
      hoverColor: Colors.transparent,
      title: Text(
        this.header,
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
        textAlign: TextAlign.left,
      ),
      trailing: this.trailing ??
          Icon(
            CupertinoIcons.chevron_right,
            color: CustomColors.yellow,
            size: 18,
          ),
      onTap: this.onTap,
    );
  }
}

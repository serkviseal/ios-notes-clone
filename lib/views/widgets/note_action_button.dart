import 'package:flutter/cupertino.dart';

class NoteActionButton extends StatelessWidget {
  const NoteActionButton({
    @required this.icon,
    @required this.text,
    @required this.childrenColor,
    this.onTap,
    Key key,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color childrenColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        height: 80,
        decoration: BoxDecoration(
          color: CupertinoColors.extraLightBackgroundGray,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(this.icon, color: this.childrenColor),
            SizedBox(height: 10),
            Text(
              this.text,
              style: TextStyle(
                color: this.childrenColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}

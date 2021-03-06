import 'package:flutter/cupertino.dart';

class CustomColors {
  static Color yellow = CupertinoColors.systemOrange;
}

class CustomIconButton extends StatelessWidget {
  CustomIconButton({@required this.icon, @required this.onPressed});
  final Icon icon;
  final Function onPressed;
  @override
  GestureDetector build(BuildContext context) {
    return GestureDetector(child: this.icon, onTap: this.onPressed);
  }
}

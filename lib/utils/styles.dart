import 'package:flutter/cupertino.dart';

class CustomColors {
  static Color yellow = Color(0xffe69327);
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

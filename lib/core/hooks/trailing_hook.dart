import 'package:flutter/cupertino.dart';

String useTrailing({@required FocusNode focusNode}) {
  if (focusNode.hasFocus)
    return "Cancel";
  else
    return "Edit";
}

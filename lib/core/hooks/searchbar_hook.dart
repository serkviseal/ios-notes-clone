import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paper/views/widgets/search_bar.dart';

Widget useAppbar(
  BuildContext context, {
  @required FocusNode focusNode,
  @required Searchbar searchbar,
}) {
  Widget middle;

  useValueChanged(focusNode.hasFocus, (_, __) {
    if (focusNode.hasFocus)
      middle = searchbar;
    else
      middle = null;
  });
  return middle;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownIconState extends StateNotifier<IconData> {
  DropdownIconState() : super(CupertinoIcons.chevron_forward);

  void toggleIcon() {
    if (state == CupertinoIcons.chevron_right)
      state = CupertinoIcons.chevron_down;
    else
      state = CupertinoIcons.chevron_right;
  }
}

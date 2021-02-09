import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

ZefyrEditor useZefyr(BuildContext context) {
  return use(_TextEditor());
}

class _TextEditor extends Hook<ZefyrEditor> {
  @override
  __TextEditorState createState() => __TextEditorState();
}

class __TextEditorState extends HookState<ZefyrEditor, _TextEditor> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initHook() {
    super.initHook();
    final _doc = _loadDocs();
    _controller = ZefyrController(_doc);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocs() {
    final Delta delta = Delta()..insert("Enter text\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  ZefyrEditor build(BuildContext context) {
    return ZefyrEditor(
      autofocus: true,
      controller: _controller,
      focusNode: _focusNode,
      padding: EdgeInsets.all(12),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
}

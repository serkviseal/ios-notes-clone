import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';

Widget useQuillEditor() => use(_QuillTextEditor());

class _QuillTextEditor extends Hook<Widget> {
  @override
  __QuillTextEditorState createState() => __QuillTextEditorState();
}

class __QuillTextEditorState extends HookState<Widget, _QuillTextEditor> {
  final QuillController _controller = QuillController.basic();
  FocusNode _focusNode;
  var data;

  @override
  void initHook() {
    super.initHook();
    _focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: QuillEditor(
            padding: EdgeInsets.zero,
            enableInteractiveSelection: true,
            scrollable: true,
            scrollController: ScrollController(),
            focusNode: _focusNode,
            expands: false,
            autoFocus: true,
            controller: _controller,
            readOnly: false,
          ),
        ),
        QuillToolbar.basic(
          controller: _controller,
          uploadFileCallback: _uploadImage,
        )
      ],
    );
  }

  Future<String> _uploadImage(File file) async {
    // return Completer<String>().future();
    //TODO: FIXME: Later
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }
}

//TODO: Save document after edit. 👇
/// The editor controller has a [document] attribute that has a
/// [toDelta()] method and with the delta_quill pkg, a delta object
/// has a [toJson()] method that returns a List<Map<dynamic>> making
/// it even easier since Hive can read List and Map.

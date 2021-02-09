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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: QuillEditor.basic(
            controller: _controller,
            readOnly: false,
          ),
        ),
        QuillToolbar.basic(
          controller: _controller,
        )
      ],
    );
  }
}

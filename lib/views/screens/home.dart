import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/core/hooks/trailing_hook.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/core/providers/dropdown_icon_provider.dart';
import 'package:paper/core/providers/folders_provider.dart';
import 'package:paper/utils/constants.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/views/screens/editor_screen.dart';
import 'package:paper/views/widgets/bottom_bar.dart';
import 'package:paper/views/widgets/folder_source_tille.dart';
import 'package:paper/views/widgets/folders_list.dart';
import 'package:paper/views/widgets/search_bar.dart';

final dropdownIconProvider = StateNotifierProvider<DropdownIconState>((ref) {
  return DropdownIconState();
});
final foldersProvider = ChangeNotifierProvider<FoldersChangeNotifier>((ref) {
  return FoldersChangeNotifier();
});

class HomeScreen extends HookWidget {
  final String title = "Folders";
  @override
  Widget build(BuildContext context) {
    final _focusNode = useFocusNode();
    final _searchController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final folderNameController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final dropdownIconState = useProvider(dropdownIconProvider.state);
    final foldersNotifier = useProvider(foldersProvider);
    final trailing = useTrailing(focusNode: _focusNode);

    final _searchbar = Searchbar(
      onTyped: (value) {
        print(_focusNode.hasFocus);
      },
      controller: _searchController,
      focusNode: _focusNode,
    );

    return Scaffold(
      bottomNavigationBar: BottomBar(
        items: [
          CustomIconButton(
            icon: Icon(
              CupertinoIcons.folder_badge_plus,
              color: CustomColors.yellow,
              size: 28,
            ),
            onPressed: () => showCupertinoDialog(
              context: context,
              builder: (_) {
                String folderName = '';
                return _createFolder(
                  folderNameController,
                  folderName,
                  _,
                  foldersNotifier,
                );
              },
            ),
          ),
          CustomIconButton(
            icon: Icon(
              Ionicons.create_outline,
              size: 28,
              color: CustomColors.yellow,
            ),
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(
                  builder: (_) => EditorScreen(previousTitle: "Folders")),
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.grey[300],
            largeTitle: Text(title),
            trailing: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  trailing,
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .navActionTextStyle
                      .copyWith(
                        color: CustomColors.yellow,
                      ),
                ),
              ),
              onTap: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => EditorScreen(
                    previousTitle: "Folders",
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _searchbar,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15),
                  removeRipple(
                    FoldersSourceTile(
                      trailing: Icon(
                        dropdownIconState,
                        color: CustomColors.yellow,
                        size: 16,
                      ),
                      header: "On My Phone",
                      onTap: () =>
                          context.read(dropdownIconProvider).toggleIcon(),
                    ),
                  ),
                  buildFoldersList(
                    pageTitle: title,
                    dropdownIconState: dropdownIconState,
                    folders: foldersNotifier.folders.values.toList(),
                  ),
                  SizedBox(height: 15),
                  removeRipple(
                    FoldersSourceTile(
                      header: "On The Cloud",
                      trailing: SizedBox(
                        width: screenWidth(context) / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Unavailable",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              CupertinoIcons.chevron_right,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  CupertinoAlertDialog _createFolder(
      TextEditingController folderNameController,
      String folderName,
      BuildContext _,
      FoldersChangeNotifier foldersNotifier) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          Text(
            "New Folder",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text("Enter a name for this folder."),
          SizedBox(height: 12),
          CupertinoTextField(
            controller: folderNameController,
            autocorrect: false,
            autofocus: true,
            cursorColor: CustomColors.yellow,
            placeholder: "Name",
            style: TextStyle(color: Colors.black),
            onChanged: (text) {
              folderName = text;
              print(folderName);
            },
          )
        ],
      ),
      actions: [
        TextButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: CustomColors.yellow),
          ),
          onPressed: () => Navigator.pop(_),
        ),
        TextButton(
          child: Text(
            "Save",
            style: TextStyle(
              color: CustomColors
                  .yellow, //TODO: the color must be grey when the textfield is empty
            ),
          ),
          onPressed: () {
            var folder = Folder(name: folderName, notes: []);
            foldersNotifier.addFolder(folder);
            return Navigator.pop(_);
          },
        ),
      ],
    );
  }
}

//TODO: Modify The page when the search bar is on focus

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/core/providers/dropdown_icon_provider.dart';
import 'package:paper/core/services/hive_service.dart';
import 'package:paper/utils/constants.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/views/screens/folder_content_screen.dart';
import 'package:paper/views/widgets/bottom_bar.dart';
import 'package:paper/views/widgets/folder_tile.dart';
import 'package:paper/views/widgets/search_bar.dart';

final dropdownIconProvider = StateNotifierProvider<DropdownIconState>((ref) {
  return DropdownIconState();
});

class HomeScreen extends HookWidget {
  final db = HiveSerice();
  @override
  Widget build(BuildContext context) {
    int notesCount = db.notesBox.length + db.foldersBox.length;
    final _searchController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    useEffect(() => _searchController.dispose, const []);
    final dropdownIconStateNotifier = useProvider(dropdownIconProvider.state);

    return Scaffold(
      bottomNavigationBar: BottomBar(
        items: [
          CustomIconButton(
            icon: Icon(
              CupertinoIcons.folder_badge_plus,
              color: CustomColors.yellow,
              size: 28,
            ),
            onPressed: () => print("//TODO: create folder"),
          ),
          CustomIconButton(
            icon: Icon(
              Ionicons.create_outline,
              size: 28,
              color: CustomColors.yellow,
            ),
            onPressed: () => print("//TODO: create note"),
          )
        ],
      ),
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            backgroundColor: Colors.grey[300],
            largeTitle: Text("Folders"),
            trailing: GestureDetector(
              child: Text(
                "Edit",
                style: TextStyle(color: CustomColors.yellow),
              ),
              onTap: () => print("//TODO: add a new Note"),
            ),
          ),
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Searchbar(controller: _searchController),
                  SizedBox(height: 15),
                  removeRipple(
                    ListTile(
                      focusColor: Colors.transparent,
                      selectedTileColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      title: Text(
                        "On My Phone",
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      trailing: Icon(
                        dropdownIconStateNotifier,
                        color: CustomColors.yellow,
                        size: 18,
                      ),
                      onTap: () =>
                          context.read(dropdownIconProvider).toggleIcon(),
                    ),
                  ),
                  Container(
                    height: 52 * defaultFolders(notesCount).length.toDouble(),
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => Divider(
                        color: Colors.grey[500],
                        indent: 65,
                      ),
                      itemCount: defaultFolders(notesCount).length,
                      itemBuilder: (context, index) {
                        var folder = defaultFolders(notesCount)[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => FolderContentScreen(
                                        title: folder.name,
                                      ))),
                          child: FolderTile(
                            folderName: folder.name,
                            notesCount: folder.notes.length,
                            icon: folder.name == 'Recently Deleted'
                                ? CupertinoIcons.trash
                                : null,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

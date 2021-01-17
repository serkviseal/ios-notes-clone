import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paper/core/providers/dropdown_icon_provider.dart';
import 'package:paper/core/services/hive_service.dart';
import 'package:paper/utils/constants.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/views/widgets/bottom_bar.dart';
import 'package:paper/views/widgets/search_bar.dart';

final dropdownIconProvider = StateNotifierProvider<DropdownIconState>((ref) {
  return DropdownIconState();
});

class HomeScreen extends HookWidget {
  final db = HiveSerice();
  @override
  Widget build(BuildContext context) {
    final _searchController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    useEffect(() => _searchController.dispose, const []);
    final dropdownIconStateNotifier = useProvider(dropdownIconProvider.state);

    return Scaffold(
      bottomNavigationBar: BottomBar(),
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
                    height: 200,
                    margin: EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ListTile(
                          title: Text("Notes"),
                          leading: Icon(
                            CupertinoIcons.folder,
                            color: CustomColors.yellow,
                          ),
                          trailing: Row(
                            children: [
                              Text(
                                "${db.notesBox.length + db.foldersBox.length}",
                              )
                            ],
                          ),
                        )
                      ],
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

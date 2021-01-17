import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';
import 'package:paper/utils/styles.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _searchbarControllerNotifier = useState(TextEditingController());
    useEffect(() {
      _searchbarControllerNotifier.value.text = '';
      return _searchbarControllerNotifier.dispose;
    }, const []);
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: kBottomNavigationBarHeight,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border(
            top: BorderSide(color: Colors.grey[400]),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                  CupertinoTextField(
                    textInputAction: TextInputAction.search,
                    onChanged: (text) {
                      print("//TODO: searched item");
                    },
                    placeholder: "Search",
                    cursorHeight: 22,
                    cursorColor: CustomColors.yellow,
                    style: TextStyle(color: Colors.black),
                    controller: _searchbarControllerNotifier.value,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200].withOpacity(0.30),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(8),
                    prefix: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Ionicons.search,
                        size: 22,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      "On My Phone",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
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

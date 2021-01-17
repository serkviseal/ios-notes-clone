import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paper/utils/styles.dart';
import 'package:paper/widgets/bottom_bar.dart';
import 'package:paper/widgets/search_bar.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _searchbarControllerNotifier = useState(TextEditingController());
    useEffect(() => _searchbarControllerNotifier.dispose, const []);

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
                  Searchbar(controllerNotifier: _searchbarControllerNotifier),
                  SizedBox(height: 15),
                  ListTile(
                    title: Text(
                      "On My Phone",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    trailing: CustomIconButton(
                      icon: Icon(
                        CupertinoIcons.chevron_forward,
                        color: CustomColors.yellow,
                        size: 20,
                      ),
                      onPressed: () => print('TODO:show list'),
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

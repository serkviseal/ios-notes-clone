import 'package:flutter/foundation.dart';
import 'package:paper/core/models/folder.dart';
import 'package:paper/core/services/hive_service.dart';

final _db = HiveSerice();

class FoldersChangeNotifier extends ChangeNotifier {
  Map<String, Folder> _folders = _db.foldersBox.toMap().cast<String, Folder>();

  Map<String, Folder> get folders => _folders;
  int get foldersCount => _folders.length;

  void addFolder(Folder folder) {
    _db.createFolder(folder);
    _folders = _db.foldersBox.toMap().cast<String, Folder>();
    notifyListeners();
  }

  void deleteFolder(Folder folder) {
    _db.deleteFolder(folder);
    _folders = _db.foldersBox.toMap().cast<String, Folder>();
    notifyListeners();
  }
}

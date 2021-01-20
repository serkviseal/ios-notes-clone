import 'package:hive/hive.dart';
import '../models/folder.dart';

class HiveSerice {
  final foldersBox = Hive.box('folders');

  String createFolder(Folder folder) {
    String key = folder.name
        .replaceAll(new RegExp(r'[^\w\s]+'), '')
        .replaceAll(' ', '-')
        .toLowerCase();
    foldersBox.put(key, folder);
    return "saved";
  }

  String deleteFolder(Folder folder) {
    String key = folder.name
        .replaceAll(new RegExp(r'[^\w\s]+'), '')
        .replaceAll(' ', '-')
        .toLowerCase();
    try {
      foldersBox.delete(key);
      return "deleted";
    } catch (e) {
      throw e;
    }
  }

  Folder getFolder(String folder) => foldersBox.get(folder);
}

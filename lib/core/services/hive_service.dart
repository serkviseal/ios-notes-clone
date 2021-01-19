import 'package:hive/hive.dart';
import '../models/folder.dart';

class HiveSerice {
  final foldersBox = Hive.box('folders');

  String save(Folder folder) {
    String key = folder.name
        .replaceAll(new RegExp(r'[^\w\s]+'), '')
        .replaceAll(' ', '-')
        .toLowerCase();
    foldersBox.put(key, folder); //TODO: remove spaces in folder name
    return "saved";
  }

  String delete(Folder folder) {
    try {
      foldersBox.delete(folder.name); //TODO: remove spaces in folder name
      return "deleted";
    } catch (e) {
      throw e;
    }
  }

  Folder getFolder(String folder) => foldersBox.get(folder);
}

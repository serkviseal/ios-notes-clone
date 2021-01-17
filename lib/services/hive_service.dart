import 'package:hive/hive.dart';
import 'package:paper/models/folder.dart';
import 'package:paper/models/note.dart';

class HiveSerice {
  final notesBox = Hive.box('notes');
  final foldersBox = Hive.box('folders');

  String save(Object object) {
    String message;
    try {
      if (object is Note) {
        notesBox.put(object.title, object);
        message = 'saved';
      } else if (object is Folder) {
        foldersBox.put(object.name, object);
        message = 'saved';
      } else {
        message = UnknownObjectException().toString();
      }
      return message;
    } catch (e) {
      return e is String ? e : e.toString();
    }
  }

  String delete(Object object) {
    String message;
    try {
      if (object is Note) {
        notesBox.delete(object.title);
        message = 'deleted';
      } else if (object is Folder) {
        foldersBox.delete(object.name);
        message = 'deleted';
      } else {
        message = UnknownObjectException().toString();
      }
      return message;
    } catch (e) {
      return e is String ? e : e.toString();
    }
  }

  Note getNote(Note note) => notesBox.get(note.title);
  Folder getFolder(Folder folder) => foldersBox.get(folder.name);
}

class UnknownObjectException implements Exception {
  @override
  String toString() => "failed! unknown object";
}

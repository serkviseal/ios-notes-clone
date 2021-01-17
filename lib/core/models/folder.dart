import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'note.dart';
part 'folder.g.dart';

@HiveType(typeId: 1)
class Folder {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<Note> notes;
  Folder({@required this.name, this.notes});
}

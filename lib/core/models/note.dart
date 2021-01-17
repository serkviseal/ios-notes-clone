import 'package:hive/hive.dart';
part 'note.g.dart';

@HiveType(typeId: 0)
class Note {
  @HiveField(0)
  String title;
  @HiveField(1)
  DateTime createdAt;

  Note({this.title = "Untitled", DateTime createdAt})
      : createdAt = createdAt ?? DateTime.now();
}

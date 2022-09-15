import 'package:isar/isar.dart';

part 'data.g.dart';

@Collection()
class Data {
  @Id()
  int? id;

  @Name("desc")
  String? description;

  @Name("link")
  String? link;

  final tags = IsarLinks<Tag>();

  DateTime createdAt = DateTime.now();
}

@Collection()
class Tag {
  int? id;

  @Index()
  late String tag;

  @Backlink(to: 'tags')
  final datas = IsarLinks<Data>();
}

import 'package:isar/isar.dart';
part 'data.g.dart';

@Collection()
class Data {
  Id id = Isar.autoIncrement;

  @Name("desc")
  String? description;

  @Name("link")
  String? link;

  IsarLinks<Tag> tags = IsarLinks<Tag>();

  DateTime createdAt = DateTime.now();
}

@Collection()
class Tag {
  Id id = Isar.autoIncrement;

  @Index()
  late String name;

  @Backlink(to: 'tags')
  final datas = IsarLinks<Data>();
}

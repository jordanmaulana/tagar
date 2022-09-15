import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  @Id()
  int? id;

  @Name("name")
  late String name;
}

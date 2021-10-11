import 'package:hive/hive.dart';

part 'dog.g.dart';

@HiveType(typeId: 0)
class Dog {
  @HiveField(0)
  late final int id;

  @HiveField(1)
  late final String name;

  @HiveField(2)
  late final int age;

  Dog({required this.id, required this.name, required this.age});
}

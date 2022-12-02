import 'package:hive/hive.dart';

part 'agency.g.dart';

@HiveType(typeId: 2)
class Agency extends HiveObject {
  @HiveField(0)
  String image_url;

  @HiveField(1)
  String name;

  Agency(
    this.image_url,
    this.name,
  );
}

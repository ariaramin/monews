import 'package:hive/hive.dart';

part 'agency.g.dart';

@HiveType(typeId: 2)
class Agnecy extends HiveObject {
  @HiveField(0)
  String image_url;

  @HiveField(1)
  String name;

  Agnecy(
    this.image_url,
    this.name,
  );
}

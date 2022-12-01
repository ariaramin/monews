import 'package:hive/hive.dart';
import 'package:monews/models/agency.dart';

part 'news.g.dart';

@HiveType(typeId: 1)
class News extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String image_url;

  @HiveField(2)
  String category;

  @HiveField(3)
  String title;

  @HiveField(4)
  String text;

  @HiveField(5)
  Agnecy agency;

  @HiveField(6)
  List<String> tags;

  @HiveField(7)
  String date;

  News(
    this.id,
    this.image_url,
    this.category,
    this.title,
    this.text,
    this.agency,
    this.tags,
    this.date,
  );
}

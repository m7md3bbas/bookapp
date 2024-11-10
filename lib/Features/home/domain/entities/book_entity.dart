import 'package:hive/hive.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  String title;
  @HiveField(1)
  String bookId;
  @HiveField(2)
  String? authorName;
  @HiveField(3)
  String image;
  @HiveField(4)
  num? rating;
  @HiveField(5)
  num? price;

  BookEntity(
      {required this.bookId,
      required this.title,
      required this.authorName,
      required this.image,
      required this.rating,
      required this.price});
}

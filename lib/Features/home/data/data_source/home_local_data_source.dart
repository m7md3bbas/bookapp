import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooksUseCase();
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeatureBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var hive = Hive.box<BookEntity>(kFeatureBooks);
    int length = hive.values.length;
    if (startIndex >= endIndex || length > endIndex) {
      return [];
    } else {
      return hive.values.toList().sublist(startIndex, endIndex);
    }
  }

  @override
  List<BookEntity> fetchNewestBooksUseCase() {
    var hive = Hive.box<BookEntity>(kNewestBooks);
    return hive.values.toList();
  }
}

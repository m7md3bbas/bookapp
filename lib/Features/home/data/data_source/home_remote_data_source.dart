import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/core/utils/api_services.dart';
import 'package:clean_arch_bookly_app/core/utils/functions/get_books_list.dart';
import 'package:clean_arch_bookly_app/core/utils/functions/save_books.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber});
  Future<List<BookEntity>> fetchNewestBooksUseCase();
}

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImp({required this.apiServices});
  @override
  Future<List<BookEntity>> fetchFeatureBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebook&q=programming&startindex=${pageNumber*10}");
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books: books , boxName: kFeatureBooks);
    return books; 
  }

 

  @override
  Future<List<BookEntity>> fetchNewestBooksUseCase() async {
    var data = await apiServices.get(
        endPoint: "volumes?Filtering=free-ebook&Sorting=newest&q=programming");
    List<BookEntity> books = getBooksList(data);
    saveBoxData(books: books , boxName: kNewestBooks);
    return books;
  }
}



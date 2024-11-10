import 'package:clean_arch_bookly_app/Features/home/data/data_source/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImp(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeatureBooks(
      {int pageNumber = 0}) async {
    try {
      var localbook =
          homeLocalDataSource.fetchFeatureBooks(pageNumber: pageNumber);
      if (localbook.isNotEmpty) {
        return right(localbook);
      }
      var books = await homeRemoteDataSource.fetchFeatureBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var localbook = homeLocalDataSource.fetchNewestBooksUseCase();
      if (localbook.isNotEmpty) {
        return right(localbook);
      }
      var books = await homeRemoteDataSource.fetchNewestBooksUseCase();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}

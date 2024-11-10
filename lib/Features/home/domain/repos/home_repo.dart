import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future <Either<Failures,List<BookEntity>>> fetchFeatureBooks({int pageNumber = 0});
  Future <Either<Failures,List<BookEntity>>> fetchNewestBooks();
}
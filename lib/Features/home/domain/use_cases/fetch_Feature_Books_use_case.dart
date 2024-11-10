import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/repos/home_repo.dart';
import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:clean_arch_bookly_app/core/use_case/onparam_use_case.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase extends OnParamUseCase<List<BookEntity>>{
 final HomeRepo homeRepo;
  FetchFeatureBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call({int pageNumber = 0}) async{
   return await homeRepo.fetchFeatureBooks(
    pageNumber: pageNumber
   );
  }
}
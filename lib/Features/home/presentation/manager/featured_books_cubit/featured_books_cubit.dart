import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/use_cases/fetch_Feature_Books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final FetchFeatureBooksUseCase fetchfeaturebooksusecase;
  FeaturedBooksCubit(this.fetchfeaturebooksusecase)
      : super(FeaturedBooksInitial());

  Future<void> fetchFeatureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await fetchfeaturebooksusecase.call(pageNumber: pageNumber);
    result.fold(
        (failure) { if (pageNumber == 0 ) {
          return FeaturedBooksFailure(errorMessage: failure.message);
         }
         else
         { 
          return FeaturedBooksPaginationFailure(errorMessage: failure.message);
         }
        },
        (books) => FeaturedBooksSuccess(book: books));
  }
}

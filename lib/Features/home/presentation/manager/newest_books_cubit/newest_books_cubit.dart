import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  final FetchNewestBooksUseCase fetchnewestbooksusecase;
  NewestBooksCubit(this.fetchnewestbooksusecase) : super(NewestBooksInitial());

  Future<void> fetchNewestBooks({int pageNumber = 0}) async {
  if (pageNumber == 0) {
      emit(NewestBooksLoading());
    } else {
      emit(NewestBooksPaginationLoading());
    }
    var result = await fetchnewestbooksusecase.call(pageNumber: pageNumber);
    result.fold(
        (failure) { if (pageNumber == 0 ) {
          return NewestBooksFailure(errorMessage: failure.message);
         }
         else
         { 
          return NewestBooksPaginationfailure(errorMessage: failure.message);
         }
        },
        (books) => NewestBooksSuccess(book: books));
  }
}

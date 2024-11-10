part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}
final class NewestBooksLoading extends NewestBooksState {}
final class NewestBooksPaginationfailure extends NewestBooksState {
  final String errorMessage ;

  NewestBooksPaginationfailure({required this.errorMessage});
}
final class NewestBooksPaginationLoading extends NewestBooksState {}
final class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure({required this.errorMessage});
}
final class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> book;

  NewestBooksSuccess({required this.book});
}
 
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/featured_list_view_loading_indecator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class FeaturedBooksListViewConsumer extends StatefulWidget {
  const FeaturedBooksListViewConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewConsumer> createState() =>
      _FeaturedBooksListViewConsumerState();
}

class _FeaturedBooksListViewConsumerState
    extends State<FeaturedBooksListViewConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.book);
        }
        if (state is FeaturedBooksPaginationFailure) {
          Get.snackbar("Error", state.errorMessage);
        }
      },
      builder: (context, state) {
        
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
         return const FeaturedListViewLoadingIndecator();
        }
      },
    );
  }
}

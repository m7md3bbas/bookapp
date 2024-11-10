import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/newest_list_view_loading.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

// ignore: must_be_immutable
class BestSellerListViewBuilder extends StatelessWidget {
  BestSellerListViewBuilder({
    super.key,
  });
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books.addAll(state.book);
        }
        if (state is NewestBooksPaginationfailure) {
          Get.snackbar("Error", state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksPaginationLoading ||
            state is NewestBooksPaginationfailure) {
          return BestSellerListView(
            books: books,
          );
        } else if (state is NewestBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const NewestListViewLoading();
        }
      },
    );
  }
}

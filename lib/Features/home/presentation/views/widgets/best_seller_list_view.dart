
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntity> books; // Callback to fetch more books

  @override
  _BestSellerListViewState createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  late ScrollController _scrollController;
  var nextPage = 1;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    var currenPostion = _scrollController.position.pixels;
    var maxLeanth = _scrollController.position.maxScrollExtent * 0.7;
    _scrollController.addListener(() {
      if (currenPostion >= maxLeanth) {
        if (!isLoading) {
          isLoading = true;
          BlocProvider.of<NewestBooksCubit>(context)
              .fetchNewestBooks(pageNumber: nextPage++);
          isLoading = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.books.isNotEmpty
        ? ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(),
              );
            })
        : const Center(child: Text('No featured books available'));
  }
}

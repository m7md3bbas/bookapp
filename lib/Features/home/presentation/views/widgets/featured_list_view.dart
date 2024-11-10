import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books; // Callback to fetch more books

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
          BlocProvider.of<FeaturedBooksCubit>(context)
              .fetchFeatureBooks(pageNumber: nextPage++);
              isLoading=false;
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: widget.books.isNotEmpty
          ? ListView.builder(
              controller: _scrollController, // Attach the controller
              scrollDirection: Axis.horizontal,
              itemCount: widget.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CustomBookImage(
                    image: widget.books[index].image,
                  ),
                );
              },
            )
          : const Center(child: Text('No featured books available')),
    );
  }
}

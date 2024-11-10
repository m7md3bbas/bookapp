import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/newest_book_image_loading.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class NewestListViewLoading extends StatelessWidget {
  const NewestListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return  const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: NewestBookContainerLoading(),
          );
        },
      ),
    );
  }
}
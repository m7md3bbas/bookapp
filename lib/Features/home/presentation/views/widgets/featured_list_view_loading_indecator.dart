import 'package:clean_arch_bookly_app/Features/home/presentation/views/widgets/custom_book_image_loading_indecator.dart';
import 'package:clean_arch_bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class FeaturedListViewLoadingIndecator extends StatelessWidget {
  const FeaturedListViewLoadingIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          // Attach the controller
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CustomBookImageLoadingIndecator(),
            );
          },
        ),
      ),
    );
  }
}

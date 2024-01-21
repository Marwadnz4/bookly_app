import 'package:bookly_app/core/utils/functions/goto_details_view.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books_cubit/featured_books_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () async {
                    goToDetailsView(context, state.books[index]);
                  },
                  child: CustomBookImage(
                    imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail,
                  ),
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const FeaturedBooksLoadingWidget();
        }
      },
    );
  }
}

import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/newest_books_loading_widget.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_cubit/search_books_cubit.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_cubit/search_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: BookListViewItem(
                book: state.books[index],
              ),
            ),
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else if (state is SearchBooksLoading) {
          return const NewestBooksLoadingWidget();
        }
        return Container();
      },
    );
  }
}

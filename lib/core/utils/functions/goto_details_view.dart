import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/functions/custom_snakbar.dart';
import 'package:connectivity_checker/connectivity_checker.dart';
import 'package:go_router/go_router.dart';

void goToDetailsView(context, book) async {
  if (await ConnectivityWrapper.instance.isConnected) {
    GoRouter.of(context).push(
      AppRouter.kBookDetailsBodyView,
      extra: book,
    );
  } else {
    customSnackBar(context, "You Are Not Connected");
  }
}

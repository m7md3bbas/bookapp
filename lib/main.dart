import 'package:clean_arch_bookly_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/use_cases/fetch_Feature_Books_use_case.dart';
import 'package:clean_arch_bookly_app/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:clean_arch_bookly_app/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:clean_arch_bookly_app/constants.dart';
import 'package:clean_arch_bookly_app/core/utils/app_router.dart';
import 'package:clean_arch_bookly_app/core/utils/functions/setup_service_locator.dart';
import 'package:clean_arch_bookly_app/core/utils/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeatureBooks);
  await Hive.openBox<BookEntity>(kNewestBooks);
  Bloc.observer = SimpleBlocObserver();
  runApp(const Bookly());
}





class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) { return FeaturedBooksCubit(
              FetchFeatureBooksUseCase(homeRepo: locator.get<HomeRepoImp>()));
  }),
        BlocProvider(
          create: (context) => NewestBooksCubit(
              FetchNewestBooksUseCase(homeRepo: locator.get<HomeRepoImp>())),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
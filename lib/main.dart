import 'package:bookly/core/utiles/api_service.dart';
import 'package:bookly/core/utiles/constants.dart';
import 'package:bookly/feauture/Home/presentation/manage/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly/feauture/Home/presentation/manage/newset_cubit/newset_cubit.dart';
import 'package:bookly/feauture/Splash/pesentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feauture/Search/presentation/manage/search_cubit/search_cubit.dart';

void main() {
  ApiService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:(context)=> FeatureBooksCubit()..getData(),
        ),
        BlocProvider(
          create:(context)=> NewSetBooksCubit()..getData(),
        ),
        BlocProvider(
          create:(context)=> SearchBooksCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home:  const SplashView(),
      ),
    );
  }
}

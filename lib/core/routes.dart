import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/home/cubit/home_cubit.dart';
import '../feature/home/home_page_screen.dart';

import '../feature/splash_screen/cubit/splash_cubit.dart';
import '../feature/splash_screen/splash_screen_view.dart';

import 'bundle.dart';

enum Screen {
  splash,
  Home,
}

class Router {
  final homeCubit = HomeCubit();

  Route<dynamic> generateRoute(RouteSettings settings) {
    var screen = Screen.values.firstWhere((e) => e.toString() == settings.name);
    switch (screen) {
      case Screen.splash:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SplashCubit(),
                child: SplashScreen(
                    arguments: settings.arguments != null
                        ? settings.arguments as Bundle
                        : null)));
      case Screen.Home:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => HomeCubit(),
                child: HomePage(
                    arguments: settings.arguments != null
                        ? settings.arguments as Bundle
                        : null)));

    }
  }
}

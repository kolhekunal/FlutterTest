import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getinforme/Model/Home.dart';

import 'package:getinforme/feature/login_screen/bloc/login_bloc.dart';
import 'package:getinforme/feature/login_screen/enterOtp_screen.dart';
import 'package:getinforme/feature/login_screen/myloginpage.dart';
import 'package:getinforme/feature/signup/bloc/signup_bloc.dart';
import 'package:getinforme/feature/signup/signup.dart';


import '../feature/home/cubit/home_cubit.dart';
import '../feature/home/home_page_screen.dart';
import '../feature/login_screen/letsStart_screen.dart';

import '../feature/splash_screen/cubit/splash_cubit.dart';
import '../feature/splash_screen/splash_screen_view.dart';

import 'bundle.dart';

enum Screen {
  splash,
  Login,
  OTP,
  Signup,
  Home,
 // PhoneAuthForm
 /* selectLanguage,
  HomeNevigation,
  SelectCategory,
  InAppWebViewScreen,
  PolicyDetails,
  PaymentSuccessPage,
  PersonalDetailsPage,
  addnominee,

  NotificationListPage,
  TransactionListPage,
  HelpPage,
  PolicyBenefits,
  CreateGoal*/
}

class Router {
  final homeCubit = HomeCubit();
  //final selectCategoryCubit = SelectCategoryCubit();
  //final profileCubit = ProfileCubit();
  //final transactionListCubit = TransactionListCubit();
  //final helpCubit = HelpCubit();
  //final nomineecubit = NomineeCubit();

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

      case Screen.Login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => LoginBloc(),
                child: LoginScreen(
                    arguments: settings.arguments != null
                        ? settings.arguments as Bundle
                        : null)));

      case Screen.Signup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => SignupBloc(),
                child: SignupScreen(

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


      case Screen.OTP:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => LoginBloc(),
                child: EnterOtpScreen(
                    arguments: settings.arguments != null
                        ? settings.arguments as Bundle
                        : null)));


/*

      case Screen.PhoneAuthForm:
        return MaterialPageRoute(
            builder: (_) =>  PhoneAuthForm(
                    arguments: settings.arguments != null
                        ? settings.arguments as Bundle
                        : null));

*/



    }
  }
}

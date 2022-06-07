
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/app_screen.dart';
import '../../core/bundle.dart';
import '../../core/routes.dart';
import '../../widgets/AppLoader.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends AppScreen {
  SplashScreen({
    RouteObserver<Route>? routeObserver,
    Key? key,
    Bundle? arguments,
  }) : super(routeObserver, key, arguments);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends AppScreenState<SplashScreen>
    with TickerProviderStateMixin {
  late SplashCubit _splashCubit;
  late final AnimationController _controller;
  late final Duration _splashEndDuration;
  bool isSkip = false;
  String result = '', userType = '';
  String userID = '0';


  @override
  Future<void> onInit() async {
    _controller = AnimationController(vsync: this);
    _splashCubit = BlocProvider.of<SplashCubit>(context);
    super.onInit();
  }


  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      navigateToScreen(Screen.Home);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget setView() {
    return BlocConsumer<SplashCubit, SplashState>(listener: (context, state) {
      if (state.isSuccess!) {}
      if (state.isFailure!) {
        if (state.errormessage != null)
          ScaffoldMessenger.of(globalKey.currentContext!)
              .showSnackBar(SnackBar(content: Text('${state.errormessage}')));
      }



    }, builder: (context, state) {
      if (!state.isLoading!)
        return SafeArea(
          child: Container(
            color: Colors.white,
            child: Center(child: Text('Splash Screen'))
          ),
        );
      return AppLoader(
        isLoading: true,
      );
      ;
    });
  }

}


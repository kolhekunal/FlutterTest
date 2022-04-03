import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getinforme/core/app_screen.dart';
import 'package:getinforme/core/bundle.dart';
import 'package:getinforme/feature/login_screen/myloginpage.dart';
import 'package:getinforme/widgets/AppLoader.dart';


import '../../core/routes.dart';
import '../Onbording/IntroScreenBody.dart';
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
  bool isSkip= false;

  @override
  Future<void> onInit() async {
    _controller = AnimationController(vsync: this);
    _splashCubit = BlocProvider.of<SplashCubit>(context);
    _splashCubit.fetchSetting();
    await FirebaseAuth.instance.signOut();
    super.onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget setView() {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.isSuccess!) {
          ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
              SnackBar(content: Text('${"Registration Successfully"}')));
   //       final bundle = Bundle()..put('mobile', _mobileController.text);
       //   navigateToScreenAndReplace(Screen.Login, bundle);
        }
        if (state.isFailure!) {
          if(state.errormessage!=null)
            ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
                SnackBar(content: Text('${state.errormessage}')));
        }

        Future.delayed(const Duration(seconds: 5), () {
          if(!isSkip)
            navigateToScreenAndReplace(Screen.Login);
        });

      /*  if (state is LoggedInState)
          Future.delayed(const Duration(seconds: 5), () {
            if (state.isLoggedIn)
              navigateToScreenAndReplace(Screen.Login);
          });*/
      },

    builder: (context, state) {
        if(!state.isLoading!)
      return SafeArea(
        child: Container(
          color: Colors.white,
          child: IntroScreenBody(
            onGetstart: () {
              setState(() {
                isSkip = true;
              });
            //  navigateToScreen(Screen.Login);
              final bundle = Bundle()..put('mobile', '9131734977');
           //   navigateToScreenAndReplace(context,bundle);
              //  _navigateToNextScreen(context);
         //     navigateToScreenAndReplace(Screen.OTP, bundle);
            }, settingData: state.settingData!=null ? state.settingData : [],
          ),
        ),
      );
      return AppLoader(
      isLoading: true,
      );;
    }
    );

  }
  Future navigateToScreenAndReplace(Screen screen, [Bundle? bundle]) async {
    bundle ??= Bundle();
    await Navigator.pushReplacementNamed(context, screen.toString(),
        arguments: bundle)
        .then(onBackResult);
  }

}

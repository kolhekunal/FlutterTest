import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getinforme/Thems/Responsive.dart';
import 'package:getinforme/core/app_screen.dart';
import 'package:getinforme/core/bundle.dart';
import 'package:getinforme/feature/login_screen/bloc/login_event.dart';
import 'package:getinforme/utility/colors.dart';
import 'package:getinforme/utility/images.dart';
import 'package:getinforme/widgets/primary_button.dart';


import '../../Thems/color_palette.dart';
import '../../core/routes.dart';
import '../../utility/strings.dart';
import '../../widgets/app_edit_text.dart';
import '../Onbording/enter_otp.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends AppScreen {
  LoginScreen({
    RouteObserver<Route>? routeObserver,
    Key? key,
    Bundle? arguments,
  }) : super(routeObserver, key, arguments);

  @override
  _LetsStartScreenState createState() => _LetsStartScreenState();
}

class _LetsStartScreenState extends AppScreenState<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late LoginBloc _loginBloc;

  @override
  void onInit() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _mobileController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    super.onInit();
  }

  void _onEmailChanged() {
    _loginBloc.add(MobileChanged(_mobileController.text));

  }

  void _onPasswordChanged() {
    _loginBloc.add(PasswordChanged(_passwordController.text));
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    _loginBloc.add(
      LoginWithCredentialsClicked(_mobileController.text,_passwordController.text),
    );
  }

  @override
  Widget setView() {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess!) {
              final bundle = Bundle()..put('mobile', _mobileController.text);
            //  _navigateToNextScreen(context);
              navigateToScreenAndReplace(Screen.OTP, bundle);
            //  navigateToScreenAndReplace(Screen.Home, bundle);
            }
            if (state.isFailure!) {
              if(state.errorMessage != null)
              ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
                  SnackBar(content: Text('${state.errorMessage}')));
            }
          },
          builder: (context, state) {
            return Container(
              color: AppColors.backgroundColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40.h-statusBarHeight,
                      child: Stack(
                        children: [

                          Center(
                            child: Container(
                              color: Colors.transparent,
                              child: SvgPicture.asset(
                                ImagePath.letStart,
                                //width:60.w,
                                height: 22.h,
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                              ),
                            ),
                          )


                        ],
                      ),
                    ),
                    Container(
                        height: 60.h,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: AppColors.letsStartBackground,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              topLeft: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                CommonButtons.LOGIN,
                                style: textTheme.headline6?.copyWith(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                     wordSpacing: 0.2,
                                    color: AppColors.letsStartTextColor),
                              ),

                              Text(
                              StringConst.sentence.Enter_your_username_password,
                                style: textTheme.subtitle1?.copyWith(
                                  fontSize: 14,
                                    color: AppColors.letsStartTextColor),
                              ),

                              SizedBox(
                                height: 29,
                              ),

                              UsernameEditText(
                                _mobileController,
                                isValid:  state.isMobile,
                                usernameType: UsernameType.mobile,
                                hinttext: StringConst.sentence.Username,
                                keyboardtype: TextInputType.number,
                                onChange: (){},
                              ),
                              SizedBox(
                                height: 19,
                              ),

                              UsernameEditText(
                                _passwordController,
                                textObsecure: true,
                                isValid: state.isPassword,
                                usernameType: UsernameType.passwoord,
                                hinttext: StringConst.sentence.Password,
                                keyboardtype: TextInputType.visiblePassword,
                                onChange: (){},
                              ),
                              SizedBox(
                                height: 28,
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  PrimaryButton(
                                      title: CommonButtons.LOGIN,
                                      isLoading:  state.isSubmitting!?true:false,
                                      textSize: 14,
                                      onPressed: () {
                                        (state.isMobile && state.isPassword)?
                                        _onLoginPressed():
                                        ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
                                            SnackBar(content: Text('Please enter valid username and password')));
                                      }, backgroundColor: Colors.blue),

                                  PrimaryButton(
                                      title: CommonButtons.SIGNUP,
                                      textSize: 14,
                                      onPressed: () {
                                        navigateToScreen(Screen.Signup);
                                      },
                                      backgroundColor: Colors.blue),
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => VerifyPhoneNumberScreen(phoneNumber: '9981271241',)));
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getinforme/Thems/Responsive.dart';
import 'package:getinforme/core/bundle.dart';
import 'package:getinforme/utility/spaces.dart';
import 'package:getinforme/utility/strings.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../Thems/color_palette.dart';
import '../../core/app_screen.dart';
import '../../core/routes.dart';
import '../../data/data_helper.dart';
import '../../utility/colors.dart';
import '../../utility/images.dart';
import '../../widgets/primary_button.dart';
import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';

class EnterOtpScreen extends AppScreen {
  EnterOtpScreen({
    RouteObserver<Route>? routeObserver,
    Key? key,
    Bundle? arguments,
  }) : super(routeObserver, key, arguments);

  @override
  _EnterOtpScreenState createState() => _EnterOtpScreenState();
}

class _EnterOtpScreenState extends AppScreenState<EnterOtpScreen> {
  late LoginBloc _loginBloc;
  final TextEditingController _otpController = TextEditingController();
  final DataHelper _dataHelper = DataHelperImpl.instance;
  OtpFieldController otpController = OtpFieldController();
  bool isShowTimer = true;


  @override
  void onInit() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _otpController.addListener(_onOtpChanged);
    _otpController.text = '123456';
    startTimer();
    super.onInit();
  }

  void _onOtpChanged() {
    _loginBloc.add(OtpChanged(_otpController.text));
  }

  void _onOtpPressed() async {
    // if (widget.arguments?.get('mobile') != null) {
    //   isfromInitialScreen = widget.arguments?.get('mobile');
    // }
    final DataHelper _dataHelper = DataHelperImpl.instance;

    var sw = await _dataHelper.cacheHelper.getAccessToken();
    print("dddd");
    _loginBloc.add(
      LoginWithCredentialsOtp(widget.arguments?.get('mobile'), sw),
    );
  }

  void _onLoginPressed() {
    setState(() {
      isShowTimer = true;
    });
    startTimer();
    _loginBloc.add(
      ResendClicked(widget.arguments?.get('mobile')),
    );
  }

  late Timer timer;
  var num = 59;

  void startTimer() {
    num = 59;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (num == 0) {
          setState(() {
            isShowTimer = false;
          });
          //_otpScreenCubit.ontimeChanged(num);
          timer.cancel();
        } else {
          //_otpScreenCubit.ontimeChanged(num - 1);

          setState(() {
            num = num - 1;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget setView() {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    // TODO: implement setView
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
          child: Container(
        color: AppColors.backgroundColor,
     child: FirebasePhoneAuthProvider(
       child:  VerifyPhoneNumberScreen(phoneNumber: "9131734977"),
     ),



     //VerifyPhoneNumberScreen(phoneNumber: '9981271241',),
     /*   child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state.isSuccess!) {
              state.isUserExist
                  ? navigateToScreenAndReplace(Screen.Login)
                  : navigateToScreenAndReplace(Screen.splash);
            }
            if (state.isFailure!) {
              ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
                  SnackBar(content: Text('${state.errorMessage}')));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  height: 50.h - statusBarHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 1,
                        right: 15,
                        child: Container(
                          color: Colors.transparent,
                          child: SvgPicture.asset(
                            ImagePath.letStart,
                            width: 60.w,
                            height: 32.h,
                            alignment: Alignment.center,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 50.h,
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
                            StringConst.sentence.Enter_OTP,
                            style: textTheme.headline6?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                                wordSpacing: 0.2,
                                color: AppColors.letsStartTextColor),
                          ),
                          Text(
                              "The OTP has been sent on +91" +
                                  widget.arguments?.get('mobile'),
                              style: textTheme.subtitle1?.copyWith(
                                  color: AppColors.letsStartTextColor,
                                  fontSize: 14)),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 55,
                            child: *//*OTPTextField(
                                controller: otpController,
                                length: 6,
                                otpFieldStyle: OtpFieldStyle(
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.focusedbordercolor,
                                  enabledBorderColor:
                                      AppColors.enabledbordercolor,
                                  disabledBorderColor:
                                      AppColors.disablebordercolor,
                                  focusBorderColor:
                                      AppColors.focusedbordercolor,
                                ),
                                width: MediaQuery.of(context).size.width,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w400),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.box,
                                fieldWidth: 40,
                                outlineBorderRadius: 8,
                                onChanged: (pin) {
                                  print("Changed: " + pin);
                                  _otpController.text = pin;
                                  _loginBloc.add(OtpChanged(pin));
                                },
                                onCompleted: (pin) {
                                  print("Completed: " + pin);
                                  _otpController.text = pin;
                                  _loginBloc.add(OtpChanged(pin));
                                })*//*
                              VerifyPhoneNumberScreen(phoneNumber: '9981271241',),
                          ),

//                           Container(
//                             height: 55,
//                             child:   OtpTextField(
//
//
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               fieldWidth: 45,
//                               numberOfFields: 6,
//                               borderColor: AppColors.outlineColor,
//                               focusedBorderColor: AppColors.outlineColor,
//                               enabledBorderColor: AppColors.outlineColor,
//                               borderWidth: 1,
//                               //  styles: otpTextStyles,
//                               showFieldAsBox: true,
//                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               fillColor: Colors.white,
//                               filled: true,
//                               borderRadius: BorderRadius.all(Radius.circular(8)),
//                               enabled: true,
//                               keyboardType: TextInputType.number,
// styles: [],
// textStyle: textTheme.bodyText1?.copyWith(color: Colors.red),
//                               //runs when a code is typed in
//                               onCodeChanged: (String code) {
//                                 _otpController.text = code;
//                                 _loginBloc.add(OtpChanged(code)) ;
//                                 //handle validation or checks here if necessary
//                               },
//                               //runs when every textfield is filled
//                               onSubmit: (String verificationCode) {
//                                 _otpController.text = verificationCode;
//                               },
//                             ),
//                           ),

                          SpaceH4(),
                          state.isFailure!
                              ? Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    StringConst.sentence.OTP_Incorrect,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                        fontStyle: FontStyle.normal,
                                        color: AppColors.resendRed),
                                  ),
                                )
                              : new Container(),
                          SizedBox(
                            height: 18,
                          ),

                          PrimaryButton(
                              title: CommonButtons.Confirm,
                              textSize: 14,
                              isLoading: state.isSubmitting! ? true : false,
                              onPressed: () {
                                _onOtpPressed();
                                // ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(
                                //     SnackBar(content: Text(StringConst.sentence.OTP_Incorrect)));
                              },
                              backgroundColor: Colors.blue),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 75.w - 30,
                                child: Text(
                                  isShowTimer
                                      ? StringConst.sentence.resend_text
                                      : StringConst
                                          .sentence.Did_not_receive_the_OTP_yet,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontStyle: FontStyle.normal,
                                      color: AppColors.letsStartTextColor),
                                ),
                              ),
                              isShowTimer
                                  ? SizedBox(
                                      width: 20.w,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Text("00:" + num.toString(),
                                            textAlign: TextAlign.end,
                                            style:
                                                textTheme.subtitle1?.copyWith(
                                              fontSize: 14,
                                              color: AppColors.timercolor,
                                            )),
                                      ))
                                  : SizedBox(
                                      width: 20.w,
                                      child: InkWell(
                                        onTap: () {
                                          print("sasds");
                                          _onLoginPressed();
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5, bottom: 5),
                                          child: Text(CommonButtons.Resend,
                                              textAlign: TextAlign.end,
                                              style:
                                                  textTheme.subtitle1?.copyWith(
                                                color: AppColors.resendRed,
                                                fontSize: 14,
                                                decoration:
                                                    TextDecoration.underline,
                                              )),
                                        ),
                                      )),
                            ],
                          ),
                        ],
                      ),
                    ))
              ],
            ));
          },
        ),*/
      )),
    );
  }
}

// ignore: must_be_immutable
class VerifyPhoneNumberScreen extends StatelessWidget {
  final String phoneNumber;

  String? _enteredOTP;

  VerifyPhoneNumberScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FirebasePhoneAuthHandler(

        phoneNumber: '+91$phoneNumber',
        timeOutDuration: Duration(seconds: 60),
        onLoginSuccess: (userCredential, autoVerified) async {
          _showSnackBar(
            context,
            'Phone number verified successfully!',
          );

          debugPrint(
            autoVerified
                ? "OTP was fetched automatically"
                : "OTP was verified manually",
          );

          debugPrint("Login Success UID: ${userCredential.user?.uid}");
        },
        onLoginFailed: (authException) {
          _showSnackBar(
            context,
            'Something went wrong (${authException.message})',
          );

          debugPrint(authException.message);
          // handle error further if needed
        },

        builder: (context, controller) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Verify Phone Number"),
              actions: [
                if (controller.codeSent)
                  TextButton(
                    child: Text(
                      controller.timerIsActive
                          ? "${controller.timerCount.inSeconds}s"
                          : "RESEND",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    ),
                    onPressed: controller.timerIsActive
                        ? null
                        : () async => await controller.sendOTP(),
                  ),
                const SizedBox(width: 5),
              ],
            ),
            body: controller.codeSent
                ? ListView(
                    padding: const EdgeInsets.all(20),
                    children: [
                      Text(
                        "We've sent an SMS with a verification code to $phoneNumber",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: controller.timerIsActive ? null : 0,
                        child: Column(
                          children: const [
                            CircularProgressIndicator.adaptive(),
                            SizedBox(height: 50),
                            Text(
                              "Listening for OTP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Divider(),
                            Text("OR", textAlign: TextAlign.center),
                            Divider(),
                          ],
                        ),
                      ),
                      const Text(
                        "Enter OTP",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextField(
                        maxLength: 6,
                        keyboardType: TextInputType.number,
                        onChanged: (String v) async {
                          _enteredOTP = v;
                          if (_enteredOTP?.length == 6) {
                            final isValidOTP = await controller.verifyOTP(
                              otp: _enteredOTP!,
                            );
                            // Incorrect OTP
                            if (!isValidOTP) {
                              _showSnackBar(
                                context,
                                "Please enter the correct OTP sent to $phoneNumber",
                              );
                            }
                          }
                        },
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator.adaptive(),
                      SizedBox(height: 50),
                      Center(
                        child: Text(
                          "Sending OTP",
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

import 'dart:async';
import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../data/data_helper.dart';
import '../../../utility/validators.dart';
import 'login_event.dart';


part 'login_state.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.empty());
  final DataHelper _dataHelper = DataHelperImpl.instance;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is MobileChanged){
      if (Validators.isValidMobile(event.mobile)) {
        yield state.copyWith(
          isMobile: true, );
      }
      else{
        yield state.copyWith(
          isMobile: false, );
      }
    }

    if (event is PasswordChanged){
      if (Validators.isValidPassword(event.password)) {
        yield state.copyWith(
          isPassword: true, );
      }
      else{
        yield state.copyWith(
          isPassword: false, );
      }
    }

    if (event is OtpChanged) {
      print('${Validators.isValidOtp(event.otp)}');
      yield state.update(isOtpValid: Validators.isValidOtp(event.otp));
    }

    if (event is EmailChanged)
      yield state.update(isEmailValid: Validators.isValidEmail(event.email));

    if (event is LoginWithCredentialsClicked) {
      if (!state.isMobile) {
        if (Validators.isValidMobile(event.mobile)) {
          yield state.copyWith(
               isMobile: true);
        }

      } else {
        if (state.isMobile)
          yield* _loginWithCredentials(event);
      }
    } else
      UnimplementedError();

    if (event is ResendClicked) {

      yield* _resendOtp(event);

    } else
      UnimplementedError();
    if (event is LoginWithCredentialsOtp) {

         // yield* _loginWithOtp(event);

    }
    else  if (event is getLanguages) {

     // yield* _loginWithOtp(event);

    }else
      UnimplementedError();
  }

  Stream<LoginState> _loginWithCredentials(
      LoginWithCredentialsClicked event) async* {
    print('mobile');
  //  yield LoginState.loading(false);
    final response = await _dataHelper.apiHelper.executeLogin(
        event.mobile,event.password);
    yield* response.fold((l) async* {
      yield LoginState.failure(l.errorMessage,false);
    },  (r) async* {
     // await _dataHelper.cacheHelper.saveAccessToken(r.data.otp.toString());

      yield LoginState.success(true);
      });

  }

  Stream<LoginState> _resendOtp(ResendClicked event) async* {
    print('otp');
    final response = await _dataHelper.apiHelper.executeLogin(
        event.mobile,'');
    yield* response.fold((l) async* {
      yield LoginState.failure(l.errorMessage,false);
    },  (r) async* {
      //await _dataHelper.cacheHelper.saveAccessToken(r.data.otp.toString());

      yield LoginState.empty();
    });
    // });
  }





}


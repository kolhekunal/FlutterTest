import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getinforme/Model/SettingModel.dart';


import '../../../data/data_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.empty());

  final DataHelper _dataHelper = DataHelperImpl.instance;


  Future<void> fetchSetting() async {
    emit(state.copyWith(isLoading: true));
    final dailyQuoteResponse = await _dataHelper.apiHelper.getSetting();
    dailyQuoteResponse.fold((l) {
      emit(state.copyWith(isLoading: false,isFailure: true,errormessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(isLoading: false,settingData: r.data));
    });
  }



/*  Future<void> getLoggedInStatus() async {
    try {
      final result = await _dataHelper.cacheHelper.isLogin();
      if (result.isNotEmpty) {
        emit(LoggedInState(result == "1" ? true : false));
      } else
        emit(LoggedInState(false));
    } catch (e) {
      emit(LoggedInState(false));
    }
  }*/
}

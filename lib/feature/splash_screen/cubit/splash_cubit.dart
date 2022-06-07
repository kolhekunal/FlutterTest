import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';



import '../../../data/data_helper.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.empty());


}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../Model/Home.dart';
import '../../../data/data_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
    HomeState(
      carddata:<Card>[],
      slider:<String>[],
      middle:Bottom(text: '',url: <String>[]),
      bottom:Bottom(text: '',url: <String>[]),
       ),
  );

  final DataHelper _dataHelper = DataHelperImpl.instance;
  bool isFetching = false;
  Card? cardlist;
  String? slider;
  List<Card>? list = List.empty(growable: true);
  List<String>? sliderlist = List.empty(growable: true);



/*  Future<void> fetchHomeData() async {
    emit(state.copyWith(isHomedataLoading: true));
    final dailyQuoteResponse = await _dataHelper.apiHelper.executeHome();
    dailyQuoteResponse.fold((l) {
      emit(state.copyWith(isHomedataLoading: false,isHomedataFailure: true,errorMsg:l.errorMessage));
    }, (r) {
      emit(state.copyWith(isHomedataLoading: false,isHomedataFailure: false, carddata: r.data.card,slider: r.data.slider,middle: r.data.middle,bottom: r.data.bottom));
    });
  }*/




}

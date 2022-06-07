import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../../../Model/Home.dart';
import '../../../Model/ProductListResponseModel.dart';
import '../../../data/data_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> with ChangeNotifier {
  HomeCubit()
      : super(
    HomeState(
      productData:<ProductData>[],
       ),
  );

  final DataHelper _dataHelper = DataHelperImpl.instance;
  bool isFetching = false;


  Future<void> fetchHomeData(String page, String pagesize) async {
    emit(state.copyWith(isHomedataLoading: true));
    final dailyQuoteResponse = await _dataHelper.apiHelper.executeProductList(page,pagesize);
    dailyQuoteResponse.fold((l) {
      print('HomeLoading>>>>Failed');
      emit(state.copyWith(isHomedataLoading: false,isHomedataFailure: true,errorMsg:l.errorMessage));
    }, (r) {
      if(r.status.toString() == '404'){
        print('HomeLoading>>>>Success');
        emit(state.copyWith(isHomedataLoading: false));
        emit(state.copyWith(isHomedataLoading: false,isHomedataFailure: true, productData: r.data!,errorMsg:r.message));

      }else{
        print('HomeLoading>>>>Success');
        emit(state.copyWith(isHomedataLoading: false));
        emit(state.copyWith(isHomedataLoading: false,isHomedataFailure: false, productData: r.data!,errorMsg:r.message));
      }
    });
  }

  Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  void addToCart(index) {
    if (_cart.containsKey(index)) {
      _cart[index] = 1+1;
    } else {
      _cart[index] = 1;
    }
    notifyListeners();
  }

  void clear(index) {
    if (_cart.containsKey(index)) {
      _cart.remove(index);
      notifyListeners();
    }
  }


}

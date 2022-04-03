import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getinforme/data/data_helper.dart';


part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial());

  @override
  Stream<AppState> mapEventToState(
    AppEvent event,
  ) async* {
    if (event is UserLogout) {
      final _dataHelper = DataHelperImpl.instance;
      try {
        await _dataHelper.cacheHelper.saveUserInfo('');
        await _dataHelper.cacheHelper.saveAccessToken('');
        yield UserLoggedOut();
      } catch (e) {
        print('Unauth Error: $e');
      }
    }
  }
}

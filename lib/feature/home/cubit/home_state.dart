part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final List<Card> carddata;
  final List<String> slider;
  final Bottom middle;
  final bool isHomedataFailure;
  final bool isHomedataLoading;
  final bool isHomedataSuccess;
  final Bottom bottom;
  final String errorMsg;
  HomeState({
    required this.carddata,
    required this.slider,
    required this.middle,
    required this.bottom,
    this.isHomedataFailure = false,
    this.isHomedataLoading = true,
    this.isHomedataSuccess = false,
    this.errorMsg=''
  });
  @override
  List<Object> get props {
    return [
      carddata,
      slider,
      middle,
      bottom,
      isHomedataFailure,
      isHomedataLoading,
      isHomedataSuccess
      ,errorMsg
    ];
  }

  HomeState copyWith(
      {List<Card>? carddata,
      List<String>? slider,
        Bottom? middle,
        Bottom? bottom,
        bool? isHomedataFailure,
        bool? isHomedataLoading,
        bool? isHomedataSuccess,
        String? errorMsg,
        }) {
    return HomeState(
      carddata: carddata ?? this.carddata,
      slider: slider ?? this.slider,
      middle: middle ?? this.middle,
      bottom: bottom ?? this.bottom,
      isHomedataFailure: isHomedataFailure ?? this.isHomedataFailure,
      isHomedataLoading: isHomedataLoading ?? this.isHomedataLoading,
      isHomedataSuccess:isHomedataSuccess??this.isHomedataSuccess,
      errorMsg:errorMsg??this.errorMsg,
       );
  }

  @override
  bool get stringify => true;
}

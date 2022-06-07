part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final List<ProductData> productData;
  final bool isHomedataFailure;
  final bool isHomedataLoading;
  final bool isHomedataSuccess;
  final String errorMsg;
  final String sponser_name;
  HomeState({
    required this.productData,
    this.isHomedataFailure = false,
    this.isHomedataLoading = true,
    this.isHomedataSuccess = false,
    this.errorMsg='',
    this.sponser_name=''
  });
  @override
  List<Object> get props {
    return [
      productData,
      isHomedataFailure,
      isHomedataLoading,
      isHomedataSuccess
      ,errorMsg,
      sponser_name
    ];
  }

  HomeState copyWith(
      {List<ProductData>? productData,
      List<String>? slider,
        bool? isHomedataFailure,
        bool? isHomedataLoading,
        bool? isHomedataSuccess,
        String? errorMsg,
        String? sponser_name,
        }) {
    return HomeState(
      productData: productData ?? this.productData,
      isHomedataFailure: isHomedataFailure ?? this.isHomedataFailure,
      isHomedataLoading: isHomedataLoading ?? this.isHomedataLoading,
      isHomedataSuccess:isHomedataSuccess??this.isHomedataSuccess,
      errorMsg:errorMsg??this.errorMsg,
      sponser_name:sponser_name??this.sponser_name,
       );
  }

  @override
  bool get stringify => true;
}

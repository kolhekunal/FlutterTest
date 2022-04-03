part of 'signup_bloc.dart';

@immutable
class SignupState extends Equatable {
  List<DistrictData> districtData;
  List<MandalData> mandalData;
  List<VillageData> villageData;
  final bool? isOtpValid;
  final bool? isEmailValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;
  String errormessage;
  final bool isMobile;
  final bool isName;
  final bool isPassword;
  final bool isResnd;
  final bool isOtp;
  final String? name;
  final String? email;
  final bool isUsernameReadOnly;
  final bool isUserExist;
  final bool isLoading;
  String districtID;
  String mandalID;
  String villageID;
  final bool isSignupLoading;
  final bool isSignupSuccess;
  final bool isSignupFailure;

  bool get isFormValid => (isMobile);

  SignupState({
    required this.districtData,
    required this.mandalData,
    required this.villageData,
    this.isLoading = false,
    this.isSubmitting= false,
    this.isSuccess,
    this.isFailure,
    this.errormessage = '',
    this.isMobile = false,
    this.isName = false,
    this.isPassword = false,
    this.isOtp = false,
    this.isUsernameReadOnly = false,
    this.isUserExist = false,
    this.isOtpValid,
    this.isEmailValid,
    this.isResnd = false,
    this.email = '',
    this.name = '',
    this.districtID = '',
    this.mandalID = '',
    this.villageID = '',
    this.isSignupLoading=false,
    this.isSignupSuccess=false,
    this.isSignupFailure=false,
  });

  factory SignupState.empty() {
    return SignupState(
        districtData: [],
        mandalData: [],
        villageData: [],
        isOtpValid: false,
        isEmailValid: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isMobile: false,
        isName: false,
        isPassword: false,
        isResnd: false,
        isUserExist: false,
        isLoading: false,
        errormessage: '',
        districtID: '',
        mandalID: '',
        villageID: '',
        isSignupLoading: false,
        isSignupFailure: false,
        isSignupSuccess: false
    );
  }

  factory SignupState.loading(bool isPartial) {
    return SignupState(
        districtData: [],
        mandalData: [],
        villageData: [],
        isLoading: true,
        isOtpValid: true,
        isEmailValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        isResnd: false,
     );
  }

  factory SignupState.failure(String errorMessage, bool isPartial) {
    return SignupState(
      mandalData: [],
      districtData: [],
      villageData: [],
      isOtpValid: false,
      isEmailValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isResnd: false,
    );
  }

  factory SignupState.socialLoginFailure(String errorMessage) {
    return SignupState(
      districtData: [],
      mandalData: [],
      villageData: [],
      isOtpValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory SignupState.success(bool? isUserExist) {
    return SignupState(
        districtData: [],
        mandalData: [],
        villageData: [],
        isOtpValid: true,
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        isResnd: false,
        isUserExist: isUserExist!,
      );
  }

  SignupState update({
    bool? isMobile,
    bool? isName,
    bool? isPassword,
    bool? isPasswordValid,
    bool? isOtpValid,
    bool? isEmailValid,
  }) {
    return copyWith(
      isOtpValid: isOtpValid,
      isEmailValid: isEmailValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  SignupState copyWith({
    List<DistrictData>? disctrictData,
    List<MandalData>? mandalData,
    List<VillageData>? villageData,
    bool? isOtpValid,
    bool? isEmailValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? isMobile,
    bool? isName,
    bool? isPassword,
    bool? isResnd,
    bool? isUsernameReadOnly,
    bool? isLoading,
    String? districtID,
    String? mandalID,
    String? villageID,
    bool? isSignupLoading,
    bool? isSignupFailure,
    bool? isSignupSuccess,
    String? errormessage,
  }) {
    return SignupState(
      districtData: disctrictData ?? this.districtData,
      mandalData: mandalData ?? this.mandalData,
      villageData: villageData ?? this.villageData,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isMobile: isMobile ?? this.isMobile,
      isName: isName ?? this.isName,
      isPassword: isPassword ?? this.isPassword,
      isUsernameReadOnly: isUsernameReadOnly ?? this.isUsernameReadOnly,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isResnd: isResnd ?? this.isResnd,
      isLoading: isLoading ?? this.isLoading,
      districtID: districtID ?? this.districtID,
      mandalID: mandalID ?? this.mandalID,
      villageID: villageID ?? this.villageID,
      isSignupLoading: isSignupLoading ?? this.isSignupLoading,
      isSignupSuccess: isSignupSuccess ?? this.isSignupSuccess,
      isSignupFailure: isSignupFailure ?? this.isSignupFailure,
      errormessage: errormessage ?? this.errormessage,
    );
  }

  @override
  String toString() {
    return '''SignupState {
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      errormessage: $errormessage,
      isSignupLoading :$isSignupLoading
isSignupFailure:$isSignupFailure
isSignupSuccess:$isSignupSuccess
     
    }''';
  }

  @override
  List<Object> get props => [
        districtData,
        mandalData,
        villageData,
        isOtpValid!,
        isSubmitting!,
        isSuccess!,
        isFailure!,
        isMobile,
        isName,
        isPassword,
        isUsernameReadOnly,
        isResnd,
        isUserExist,
        districtID,
        mandalID,
        villageID,
    isSignupLoading,
    isSignupFailure,
    isSignupSuccess,
    errormessage
      ];

  @override
  bool get stringify => true;
}

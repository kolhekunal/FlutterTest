part of 'login_bloc.dart';

@immutable
class LoginState extends Equatable {
  LoginState(
      {this.isSubmitting,
        this.isSuccess,
        this.isFailure,
        this.errorMessage,
        this.isMobile = false,
        this.isPassword = false,
        this.isOtp = false,
        this.isUsernameReadOnly = false,
        this.isUserExist=false,
        this.isOtpValid,
        this.isEmailValid,
        this.isResnd = false,
        this.email = '',
        this.name = ''});
  factory LoginState.empty() {
    return LoginState(
        isOtpValid: false,
        isEmailValid: false,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isMobile: false,
        isPassword: false,
        isResnd: false,
        isUserExist:false,
        errorMessage: '');
  }
  factory LoginState.loading(bool isPartial) {
    return LoginState(
        isOtpValid: true,
        isEmailValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        isResnd: false,
        errorMessage: '');
  }
  factory LoginState.failure(String errorMessage, bool isPartial) {
    return LoginState(
      isOtpValid: false,
      isEmailValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      isResnd: false,
      errorMessage: errorMessage,
    );
  }

  factory LoginState.socialLoginFailure(String errorMessage) {
    return LoginState(
      isOtpValid: false,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
      errorMessage: errorMessage,
    );
  }

  factory LoginState.success(bool? isUserExist) {
    return LoginState(
        isOtpValid: true,
        isEmailValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        isResnd: false,
        isUserExist:isUserExist!,
        errorMessage: '');
  }

  final bool? isOtpValid;
  final bool? isEmailValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;

  final String? errorMessage;
  final bool isMobile;
  final bool isPassword;
  final bool isResnd;
  final bool isOtp;
  final String? name;
  final String? email;
  final bool isUsernameReadOnly;
  final bool isUserExist;


  bool get isFormValid => (isMobile);

  LoginState update({
    bool? isMobile,
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

  LoginState copyWith({
    bool? isOtpValid,
    bool? isEmailValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    bool? isMobile,
    bool? isPassword,
    bool? isResnd,
    bool? isUsernameReadOnly,
  }) {
    return LoginState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      isMobile: isMobile ?? this.isMobile,
      isPassword: isPassword ?? this.isPassword,
      isUsernameReadOnly: isUsernameReadOnly ?? this.isUsernameReadOnly,
      isOtpValid: isOtpValid ?? this.isOtpValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isResnd: isResnd ?? this.isResnd,
    );
  }

  @override
  String toString() {
    return '''LoginState {
    
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
     
    }''';
  }

  @override
  List<Object> get props => [
    isOtpValid!,
    isSubmitting!,
    isSuccess!,
    isFailure!,
    isMobile,
    isPassword,
    isUsernameReadOnly,
    isResnd,isUserExist
  ];
}
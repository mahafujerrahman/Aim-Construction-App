part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGNUP = _Paths.SIGNUP;
  static const HOME = _Paths.HOME;
  static const splashScreen = _Paths.splashScreen;
  static const onboardingScreen = _Paths.onboardingScreen;
  static const successfullScreen = _Paths.successfullScreen;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const VERIFY_EMAIL = _Paths.VERIFY_EMAIL;
}

abstract class _Paths {
  _Paths._();
  static const splashScreen = '/splashScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const SIGN_IN = '/sign-in';
  static const HOME = '/home';
  static const SIGNUP = '/signup';
  static const FORGET_PASSWORD = '/forget-password';
  static const VERIFY_EMAIL = '/verify-email';
  static const successfullScreen = '/successfullScreen';
}

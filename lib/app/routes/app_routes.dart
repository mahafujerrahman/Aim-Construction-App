part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const SIGN_IN = _Paths.SIGN_IN;
  static const SIGNUP = _Paths.SIGNUP;
  static const splashScreen = _Paths.splashScreen;
  static const onboardingScreen = _Paths.onboardingScreen;
  static const successfullScreen = _Paths.successfullScreen;
  static const FORGET_PASSWORD = _Paths.FORGET_PASSWORD;
  static const VERIFY_EMAIL = _Paths.VERIFY_EMAIL;
  static const resetPasswordScreen = _Paths.resetPasswordScreen;
  static const ROLE_SUPERVISOR_HOME_SCREEN = _Paths.ROLE_SUPERVISOR_HOME_SCREEN;
  static const ROLE_SUPERVISOR_MORE = _Paths.ROLE_SUPERVISOR_MORE;
  static const ROLE_SUPERVISOR_PROJECT_TOOL = _Paths.ROLE_SUPERVISOR_PROJECT_TOOL;
}

abstract class _Paths {
  _Paths._();
  static const splashScreen = '/splashScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const SIGN_IN = '/sign-in';
  static const SIGNUP = '/signup';
  static const FORGET_PASSWORD = '/forget-password';
  static const VERIFY_EMAIL = '/verify-email';
  static const successfullScreen = '/successfullScreen';
  static const resetPasswordScreen = '/reset-password';

  static const ROLE_SUPERVISOR_HOME_SCREEN = '/home-screen';
  static const ROLE_SUPERVISOR_MORE = '/more';
  static const ROLE_SUPERVISOR_PROJECT_TOOL = '/project-tool';
}

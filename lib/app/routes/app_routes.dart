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
  static const ROLE_SUPERVISOR_PROJECT_TOOL =
      _Paths.ROLE_SUPERVISOR_PROJECT_TOOL;
  static const ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN =
      _Paths.ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN;
  static const ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION =
      _Paths.ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION;
  static const settingScreen = _Paths.settingScreen;
  static const changePasswordScreen = _Paths.changePasswordScreen;
  static const contactUsScreen = _Paths.contactUsScreen;
  static const privacyPolicyScreen = _Paths.privacyPolicyScreen;
  static const termsandConditionsScreen = _Paths.termsandConditionsScreen;
  static const aboutUsScreen = _Paths.aboutUsScreen;
  static const ROLE_SUPERVISOR_ACTIVITY_SCREEN =
      _Paths.ROLE_SUPERVISOR_ACTIVITY_SCREEN;
  static const ROLE_SUPERVISOR_DAILY_LOG = _Paths.ROLE_SUPERVISOR_DAILY_LOG;
  static const ROLE_SUPERVISOR_TASK = _Paths.ROLE_SUPERVISOR_TASK;
  static const ROLE_SUPERVISOR_IMAGES = _Paths.ROLE_SUPERVISOR_IMAGES;
  static const ROLE_SUPERVISOR_DOCUMENTS = _Paths.ROLE_SUPERVISOR_DOCUMENTS;
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
  static const settingScreen = '/settingScreen';
  static const changePasswordScreen = '/changePasswordScreen';
  static const contactUsScreen = '/contactUsScreen';
  static const privacyPolicyScreen = '/privacyPolicyScreen';
  static const termsandConditionsScreen = '/termsandConditionsScreen';
  static const aboutUsScreen = '/aboutUsScreen';

  static const ROLE_SUPERVISOR_HOME_SCREEN = '/home-screen';
  static const ROLE_SUPERVISOR_MORE = '/more';
  static const ROLE_SUPERVISOR_PROJECT_TOOL = '/project-tool';
  static const ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN =
      '/personal-information-screen';
  static const ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION =
      '/edit-personal-information';

  static const ROLE_SUPERVISOR_ACTIVITY_SCREEN = '/activity-screen';
  static const ROLE_SUPERVISOR_DAILY_LOG = '/daily-log';
  static const ROLE_SUPERVISOR_TASK = '/task';
  static const ROLE_SUPERVISOR_IMAGES = '/images';
  static const ROLE_SUPERVISOR_DOCUMENTS = '/documents';
}

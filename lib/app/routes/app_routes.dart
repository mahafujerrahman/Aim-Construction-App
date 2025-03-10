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
  static const ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN = _Paths.ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN;
  static const ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION = _Paths.ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION;
  static const settingScreen = _Paths.settingScreen;
  static const changePasswordScreen = _Paths.changePasswordScreen;
  static const contactUsScreen = _Paths.contactUsScreen;
  static const privacyPolicyScreen = _Paths.privacyPolicyScreen;
  static const termsandConditionsScreen = _Paths.termsandConditionsScreen;
  static const aboutUsScreen = _Paths.aboutUsScreen;
  static const ROLE_SUPERVISOR_ACTIVITY_SCREEN = _Paths.ROLE_SUPERVISOR_ACTIVITY_SCREEN;
  static const ROLE_SUPERVISOR_DAILY_LOG = _Paths.ROLE_SUPERVISOR_DAILY_LOG;
  static const ROLE_SUPERVISOR_TASK = _Paths.ROLE_SUPERVISOR_TASK;
  static const ROLE_SUPERVISOR_IMAGES = _Paths.ROLE_SUPERVISOR_IMAGES;
  static const supervisorDocuments = _Paths.supervisorDocuments;
  static const taskStatusScreen = _Paths.taskStatusScreen;
  static const dailyNoteDetailsScreen = _Paths.dailyNoteDetailsScreen;
  static const addNewNoteScreen = _Paths.addNewNoteScreen;

  //manager
  static const managerHomeScreen = _Paths.managerHomeScreen;
  static const managerMoreScreen = _Paths.managerMoreScreen;
  static const managerActivityScreen = _Paths.managerActivityScreen;
  static const mySupervisorListScreen = _Paths.mySupervisorListScreen;
  static const indivitualSupervisorInfoScreen = _Paths.indivitualSupervisorInfoScreen;
  static const managerProjectToolsScreen = _Paths.managerProjectToolsScreen;
  static const managerContactScreen = _Paths.managerContactScreen;
  static const managerDailyLogScreen = _Paths.managerDailyLogScreen;
  static const projectReportDetailsScreen = _Paths.projectReportDetailsScreen;
  static const projectCreateScreen = _Paths.projectCreateScreen;
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
  static const ROLE_SUPERVISOR_PERSONAL_INFORMATION_SCREEN = '/personal-information-screen';
  static const ROLE_SUPERVISOR_EDIT_PERSONAL_INFORMATION = '/edit-personal-information';

  static const ROLE_SUPERVISOR_ACTIVITY_SCREEN = '/activity-screen';
  static const ROLE_SUPERVISOR_DAILY_LOG = '/daily-log';
  static const ROLE_SUPERVISOR_TASK = '/task';
  static const ROLE_SUPERVISOR_IMAGES = '/images';
  static const supervisorDocuments = '/documents';
  static const taskStatusScreen = '/taskStatusScreen';
  static const dailyNoteDetailsScreen = '/dailyNoteDetailsScreen';
  static const addNewNoteScreen = '/addNewNoteScreen';



  //manager
  static const managerHomeScreen = '/managerHomeScreen';
  static const managerMoreScreen = '/managerMoreScreen';
  static const managerActivityScreen = '/managerActivityScreen';
  static const mySupervisorListScreen = '/mySupervisorListScreen';
  static const indivitualSupervisorInfoScreen = '/indivitualSupervisorInfoScreen';
  static const managerProjectToolsScreen = '/managerProjectToolsScreen';
  static const managerContactScreen = '/managerContactScreen';
  static const managerDailyLogScreen = '/managerDailyLogScreen';
  static const projectReportDetailsScreen = '/projectReportDetailsScreen';
  static const projectCreateScreen = '/projectCreateScreen';

}

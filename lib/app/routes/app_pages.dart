import 'package:aim_construction_app/app/modules/forgetPassword/bindings/forget_password_binding.dart';
import 'package:aim_construction_app/app/modules/forgetPassword/views/forget_password_view.dart';
import 'package:aim_construction_app/app/modules/resetPassword/bindings/reset_password_binding.dart';
import 'package:aim_construction_app/app/modules/resetPassword/views/reset_password_view.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/bindings/role_supervisor_home_screen_binding.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/homeScreen/views/role_supervisor_home_screen_view.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/more/bindings/role_supervisor_more_binding.dart';
import 'package:aim_construction_app/app/modules/role/supervisor/more/views/role_supervisor_more_view.dart';
import 'package:aim_construction_app/app/modules/signup/bindings/signup_binding.dart';
import 'package:aim_construction_app/app/modules/signup/views/signupScreen.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/bindings/verify_email_binding.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/views/successfull_screen.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/views/verify_email_view.dart';
import 'package:aim_construction_app/onboarding_screen.dart';
import 'package:aim_construction_app/splash_screen.dart';
import 'package:get/get.dart';


import '../modules/sign_in/bindings/sign_in_binding.dart';
import '../modules/sign_in/views/signInScreen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = AppRoutes.SIGN_IN;

  static final routes = [
    GetPage(name: _Paths.splashScreen, page: () => const SplashScreen()),
    GetPage(name: _Paths.onboardingScreen, page: () => const OnboardingScreen()),

    GetPage(name: _Paths.SIGN_IN, page: () => const SignInScreen(), binding: SignInBinding()),
    GetPage(name: _Paths.SIGNUP, page: () => const SignUpScreen(), binding: SignupBinding()),

    GetPage(name: _Paths.FORGET_PASSWORD, page: () =>  ForgotPasswordScreen(),binding: ForgetPasswordBinding()),
    GetPage(name: _Paths.VERIFY_EMAIL, page: () =>  VerifyCodeScreen(),binding: VerifyEmailBinding()),
    GetPage(name: _Paths.resetPasswordScreen, page: () =>  ResetPasswordScreen(),binding: ResetPasswordBinding()),
    GetPage(name: _Paths.successfullScreen, page: () =>  SuccessfullScreen()),
    GetPage(name: _Paths.ROLE_SUPERVISOR_HOME_SCREEN, page: () =>  SupervisorHomeScreenView(),binding: RoleSupervisorHomeScreenBinding()),
    GetPage(name: _Paths.ROLE_SUPERVISOR_MORE, page: () =>  SupervisorMoreView(),binding: RoleSupervisorMoreBinding()),


  ];
}

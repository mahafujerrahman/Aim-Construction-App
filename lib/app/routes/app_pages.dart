import 'package:aim_construction_app/app/modules/forgetPassword/bindings/forget_password_binding.dart';
import 'package:aim_construction_app/app/modules/forgetPassword/views/forget_password_view.dart';
import 'package:aim_construction_app/app/modules/resetPassword/bindings/reset_password_binding.dart';
import 'package:aim_construction_app/app/modules/resetPassword/views/reset_password_view.dart';
import 'package:aim_construction_app/app/modules/signup/bindings/signup_binding.dart';
import 'package:aim_construction_app/app/modules/signup/views/signupScreen.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/bindings/verify_email_binding.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/views/successfull_screen.dart';
import 'package:aim_construction_app/app/modules/verifyEmail/views/verify_email_view.dart';
import 'package:aim_construction_app/onboarding_screen.dart';
import 'package:aim_construction_app/splash_screen.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
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

    GetPage(name: _Paths.HOME, page: () =>  HomeView(),binding: HomeBinding()),
    GetPage(name: _Paths.FORGET_PASSWORD, page: () =>  ForgotPasswordScreen(),binding: ForgetPasswordBinding()),
    GetPage(name: _Paths.VERIFY_EMAIL, page: () =>  VerifyCodeScreen(),binding: VerifyEmailBinding()),
    GetPage(name: _Paths.resetPasswordScreen, page: () =>  ResetPasswordScreen(),binding: ResetPasswordBinding()),
    GetPage(name: _Paths.successfullScreen, page: () =>  SuccessfullScreen()),


  ];
}

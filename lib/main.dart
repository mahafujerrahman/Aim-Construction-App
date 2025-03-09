import 'package:aim_construction_app/firebase_options.dart';
import 'package:aim_construction_app/service/firebase_service.dart';
import 'package:aim_construction_app/utils/app_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'common/controller/localization_controller.dart';
import 'common/controller/theme_controller.dart';
import 'common/di/di.dart';
import 'common/prefs_helper/prefs_helpers.dart';
import 'common/themes/light_theme.dart';
import 'common/widgets/message.dart';

String token = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  Map<String, Map<String, String>> _languages = await init();
  NotificationHelper.getFcmToken();
  runApp(
    MyApp(
      languages: _languages,
    ),
  );
  token = await PrefsHelper.getString('token');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});

  final Map<String, Map<String, String>> languages;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return ScreenUtilInit(
            designSize: const Size(393, 852),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return GetMaterialApp(
                title: AppConstants.APP_NAME,
                debugShowCheckedModeBanner: false,
                navigatorKey: Get.key,
                // theme: themeController.darkTheme ? dark(): light(),
                theme: light(),
                defaultTransition: Transition.topLevel,
                locale: localizeController.locale,
                translations: Messages(languages: languages),
                fallbackLocale: Locale(AppConstants.languages[0].languageCode,
                    AppConstants.languages[0].countryCode),
                transitionDuration: const Duration(milliseconds: 500),
                getPages: AppPages.routes,
                initialRoute:AppRoutes.splashScreen,
              );
            });
      });
    });
  }

  String authenticationRoute() {
    if (token.isNotEmpty) {
      return AppRoutes.ROLE_SUPERVISOR_HOME_SCREEN;
    } else {
      return AppPages.INITIAL;
    }
  }
}

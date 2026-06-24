import 'package:get/get.dart';

import '../../modules/auth/bindings/auth_binding.dart';
import '../../modules/auth/views/forgot_password_view.dart';
import '../../modules/auth/views/login_view.dart';
import '../../modules/auth/views/register_view.dart';
import '../../modules/auto_jap/bindings/auto_jap_binding.dart';
import '../../modules/auto_jap/view/auto_jap_view.dart';
import '../../modules/favorites/bindings/favorites_binding.dart';
import '../../modules/favorites/views/favorites_view.dart';
import '../../modules/festivals/bindings/festivals_binding.dart';
import '../../modules/festivals/views/festivals_view.dart';
import '../../modules/god_detail/bindings/god_detail_binding.dart';
import '../../modules/god_detail/views/god_detail_view.dart';
import '../../modules/jap/bindings/jap_binding.dart';
import '../../modules/jap/views/jap_view.dart';
import '../../modules/main_navigation/bindings/main_navigation_binding.dart';
import '../../modules/main_navigation/views/main_navigation_view.dart';
import '../../modules/music/Views/music_player_view.dart';
import '../../modules/music/bindings/music_player_binding.dart';
import '../../modules/notifications/bindings/notifications_binding.dart';
import '../../modules/notifications/views/notifications_view.dart';
import '../../modules/quotes/bindings/quotes_binding.dart';
import '../../modules/quotes/views/quotes_view.dart';
import '../../modules/search/bindings/search_binding.dart';
import '../../modules/search/views/search_view.dart';
import '../../modules/settings/bindings/settings_binding.dart';
import '../../modules/settings/views/settings_view.dart';
import '../../modules/splash/bindings/splash_binding.dart';
import '../../modules/splash/views/splash_view.dart';

import '../../modules/onboarding/bindings/onboarding_binding.dart';
import '../../modules/onboarding/views/onboarding_view.dart';

import '../../modules/home/bindings/home_binding.dart';
import '../../modules/home/views/home_view.dart';

import '../../modules/temples/bindings/temples_binding.dart';
import '../../modules/temples/views/temples_view.dart';
import 'app_routes.dart';

class AppPages {

  AppPages._();

  static final pages = <GetPage>[

    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),

    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: Routes.MAIN_NAVIGATION,
      page: () =>const MainNavigationView(),
      binding: MainNavigationBinding(),
    ),

    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),

    GetPage(
      name: Routes.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),

    GetPage(
      name: Routes.Jap,
      page: () => const JapView(),
      binding: JapBinding(),
    ),

    GetPage(
      name: Routes.FESTIVALS,
      page: () => const FestivalsView(),
      binding: FestivalsBinding(),
    ),

    GetPage(
      name: Routes.QUOTES,
      page: () => const QuotesView(),
      binding: QuotesBinding(),
    ),

    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),

    GetPage(
      name: Routes.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: Routes.TEMPLES,
      page: () => const TemplesView(),
      binding: TemplesBinding(),
    ),


    GetPage(
      name: Routes.GOD_DETAIL,
      page: () => const GodDetailView(),
      binding: GodDetailBinding(),
    ),

    GetPage(
      name:  Routes.MUSIC,
      page: () => const MusicPlayerView(),
      binding: MusicPlayerBinding(),
    ),

    GetPage(
      name:  Routes.AUTOJAP,
      page: () => const AutoJapView(),
      binding: AutoJapBinding(),
    ),

  ];
}
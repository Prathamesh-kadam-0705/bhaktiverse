import 'package:bhakti_app/features/auto_jap/bindings/auto_jap_binding.dart';
import 'package:bhakti_app/features/auto_jap/view/auto_jap_view.dart';
import 'package:bhakti_app/features/god_detail/bindings/god_detail_binding.dart';
import 'package:bhakti_app/features/god_detail/views/god_detail_view.dart';
import 'package:bhakti_app/features/jap/bindings/jap_binding.dart';
import 'package:bhakti_app/features/jap/views/jap_view.dart';
import 'package:bhakti_app/features/music/Views/music_player_view.dart';
import 'package:bhakti_app/features/music/bindings/music_player_binding.dart';
import 'package:bhakti_app/modules/home/binding/home_binding.dart';
import 'package:bhakti_app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {

  static final pages = [

    GetPage(
      name: '/',
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: '/jap',
      page: () => const JapView(),
      binding: JapBinding(),
    ),

    GetPage(
      name: '/god-detail',
      page: () => const GodDetailView(),
      binding: GodDetailBinding(),
    ),

    GetPage(
      name: '/music-player',
      page: () => const MusicPlayerView(),
      binding: MusicPlayerBinding(),
    ),

    GetPage(
      name: '/auto-jap',
      page: () => const AutoJapView(),
      binding: AutoJapBinding(),
    ),
  ];
}

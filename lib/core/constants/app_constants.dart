// lib/core/constants/app_constants.dart

class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'भक्ती App';
  static const String appVersion = '1.0.0';

  // API Base URL - Replace with your backend URL
  static const String baseUrl = 'https://your-api-domain.com/api/v1';

  // API Endpoints
  static const String endpointMantras = '/mantras';
  static const String endpointMantrasByGod = '/mantras';       // GET /mantras/{god}
  static const String endpointSongs = '/songs';
  static const String endpointSongsByGod = '/songs';           // GET /songs/{god}
  static const String endpointJapSave = '/jap/save';
  static const String endpointJapHistory = '/jap/history';
  static const String endpointJapStats = '/jap/stats';
  static const String endpointGods = '/gods';
  static const String endpointPlaylists = '/playlists';
  static const String endpointAuth = '/auth';
  static const String endpointUser = '/user';

  // Hive Box Names
  static const String boxJapSessions = 'jap_sessions';
  static const String boxPlaylists = 'playlists';
  static const String boxSettings = 'settings';
  static const String boxCachedMantras = 'cached_mantras';
  static const String boxCachedSongs = 'cached_songs';
  static const String boxFavorites = 'favorites';

  // SharedPreferences Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyUserId = 'user_id';
  static const String keyDarkMode = 'dark_mode';
  static const String keyDailyReminderTime = 'daily_reminder_time';
  static const String keySelectedGod = 'selected_god';
  static const String keyTotalLifetimeJap = 'total_lifetime_jap';
  static const String keyCurrentStreak = 'current_streak';
  static const String keyLastJapDate = 'last_jap_date';

  // Jap Count Options
  static const List<int> japCountOptions = [11, 21, 51, 108, 1008];

  // Default Mantras Count
  static const int defaultMalaCount = 108;

  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration longAnimation = Duration(milliseconds: 800);

  // API Timeout
  static const Duration apiTimeout = Duration(seconds: 30);

  // Notification IDs
  static const int dailyReminderNotificationId = 1001;
  static const int morningMantraNotificationId = 1002;
  static const int streakReminderNotificationId = 1003;

  // God Names
  static const List<String> defaultGods = [
    'Ganpati',
    'Shiv',
    'Krishna',
    'Ram',
    'Hanuman',
    'Devi',
    'Vitthal',
    'Datta',
    'Saraswati',
    'Lakshmi',
  ];
}
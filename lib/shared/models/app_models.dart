// lib/shared/models/app_models.dart
// ─── All Data Models for the bhaktiverse ───────────────────────────────────

import 'package:hive/hive.dart';




// ─────────────────────────── MANTRA MODEL ───────────────────────────────────

@HiveType(typeId: 0)
class Mantra extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String godName;
  @HiveField(2) final String mantraName;
  @HiveField(3) final String mantraText;
  @HiveField(4) final String audioUrl;
  @HiveField(5) final String? meaning;
  @HiveField(6) final int durationSeconds;
  @HiveField(7) final String? imageUrl;
  @HiveField(8) final String language;
  @HiveField(9) final bool isFavorite;

  Mantra({
    required this.id,
    required this.godName,
    required this.mantraName,
    required this.mantraText,
    required this.audioUrl,
    this.meaning,
    required this.durationSeconds,
    this.imageUrl,
    this.language = 'marathi',
    this.isFavorite = false,
  });

  factory Mantra.fromJson(Map<String, dynamic> json) => Mantra(
    id: json['id'] as String,
    godName: json['god_name'] as String,
    mantraName: json['mantra_name'] as String,
    mantraText: json['mantra_text'] as String,
    audioUrl: json['audio_url'] as String,
    meaning: json['meaning'] as String?,
    durationSeconds: json['duration_seconds'] as int? ?? 0,
    imageUrl: json['image_url'] as String?,
    language: json['language'] as String? ?? 'marathi',
    isFavorite: json['is_favorite'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'god_name': godName,
    'mantra_name': mantraName,
    'mantra_text': mantraText,
    'audio_url': audioUrl,
    'meaning': meaning,
    'duration_seconds': durationSeconds,
    'image_url': imageUrl,
    'language': language,
    'is_favorite': isFavorite,
  };

  Mantra copyWith({bool? isFavorite}) => Mantra(
    id: id,
    godName: godName,
    mantraName: mantraName,
    mantraText: mantraText,
    audioUrl: audioUrl,
    meaning: meaning,
    durationSeconds: durationSeconds,
    imageUrl: imageUrl,
    language: language,
    isFavorite: isFavorite ?? this.isFavorite,
  );
}

// ─────────────────────────── GOD MODEL ──────────────────────────────────────

@HiveType(typeId: 1)
class God extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String name;
  @HiveField(2) final String nameMarathi;
  @HiveField(3) final String imageUrl;
  @HiveField(4) final String? description;
  @HiveField(5) final int mantraCount;
  @HiveField(6) final int songCount;

  God({
    required this.id,
    required this.name,
    required this.nameMarathi,
    required this.imageUrl,
    this.description,
    this.mantraCount = 0,
    this.songCount = 0,
  });

  factory God.fromJson(Map<String, dynamic> json) => God(
    id: json['id'] as String,
    name: json['name'] as String,
    nameMarathi: json['name_marathi'] as String? ?? json['name'] as String,
    imageUrl: json['image_url'] as String,
    description: json['description'] as String?,
    mantraCount: json['mantra_count'] as int? ?? 0,
    songCount: json['song_count'] as int? ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'name_marathi': nameMarathi,
    'image_url': imageUrl,
    'description': description,
    'mantra_count': mantraCount,
    'song_count': songCount,
  };
}

// ─────────────────────────── SONG MODEL ─────────────────────────────────────

@HiveType(typeId: 2)
class DevotionalSong extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String godName;
  @HiveField(2) final String title;
  @HiveField(3) final String artist;
  @HiveField(4) final String audioUrl;
  @HiveField(5) final String? thumbnailUrl;
  @HiveField(6) final int durationSeconds;
  @HiveField(7) final String category; // bhajan, aarti, mantra, song
  @HiveField(8) bool isFavorite;
  @HiveField(9) final String? lyrics;

  DevotionalSong({
    required this.id,
    required this.godName,
    required this.title,
    required this.artist,
    required this.audioUrl,
    this.thumbnailUrl,
    required this.durationSeconds,
    required this.category,
    this.isFavorite = false,
    this.lyrics,
  });

  factory DevotionalSong.fromJson(Map<String, dynamic> json) => DevotionalSong(
    id: json['id'] as String,
    godName: json['god_name'] as String,
    title: json['title'] as String,
    artist: json['artist'] as String? ?? 'Unknown',
    audioUrl: json['audio_url'] as String,
    thumbnailUrl: json['thumbnail_url'] as String?,
    durationSeconds: json['duration_seconds'] as int? ?? 0,
    category: json['category'] as String? ?? 'bhajan',
    isFavorite: json['is_favorite'] as bool? ?? false,
    lyrics: json['lyrics'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'god_name': godName,
    'title': title,
    'artist': artist,
    'audio_url': audioUrl,
    'thumbnail_url': thumbnailUrl,
    'duration_seconds': durationSeconds,
    'category': category,
    'is_favorite': isFavorite,
    'lyrics': lyrics,
  };

  String get formattedDuration {
    final minutes = durationSeconds ~/ 60;
    final seconds = durationSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

// ─────────────────────────── JAP SESSION MODEL ──────────────────────────────

@HiveType(typeId: 3)
class JapSession extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) final String mantraId;
  @HiveField(2) final String mantraName;
  @HiveField(3) final String godName;
  @HiveField(4) int count;
  @HiveField(5) final DateTime date;
  @HiveField(6) final int targetCount;
  @HiveField(7) DateTime? completedAt;
  @HiveField(8) bool isSynced;

  JapSession({
    required this.id,
    required this.mantraId,
    required this.mantraName,
    required this.godName,
    required this.count,
    required this.date,
    required this.targetCount,
    this.completedAt,
    this.isSynced = false,
  });

  factory JapSession.fromJson(Map<String, dynamic> json) => JapSession(
    id: json['id'] as String,
    mantraId: json['mantra_id'] as String,
    mantraName: json['mantra_name'] as String,
    godName: json['god_name'] as String,
    count: json['count'] as int,
    date: DateTime.parse(json['date'] as String),
    targetCount: json['target_count'] as int? ?? 108,
    completedAt: json['completed_at'] != null
        ? DateTime.parse(json['completed_at'] as String)
        : null,
    isSynced: json['is_synced'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'mantra_id': mantraId,
    'mantra_name': mantraName,
    'god_name': godName,
    'count': count,
    'date': date.toIso8601String(),
    'target_count': targetCount,
    'completed_at': completedAt?.toIso8601String(),
    'is_synced': isSynced,
  };

  bool get isCompleted => count >= targetCount;
  double get progress => targetCount > 0 ? (count / targetCount).clamp(0.0, 1.0) : 0;
}

// ─────────────────────────── PLAYLIST MODEL ─────────────────────────────────

@HiveType(typeId: 4)
class Playlist extends HiveObject {
  @HiveField(0) final String id;
  @HiveField(1) String playlistName;
  @HiveField(2) List<String> mantraIds;
  @HiveField(3) final DateTime createdAt;
  @HiveField(4) bool isFavorite;
  @HiveField(5) String? description;
  @HiveField(6) bool isDailyAutoPlay;

  Playlist({
    required this.id,
    required this.playlistName,
    required this.mantraIds,
    required this.createdAt,
    this.isFavorite = false,
    this.description,
    this.isDailyAutoPlay = false,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
    id: json['id'] as String,
    playlistName: json['playlist_name'] as String,
    mantraIds: List<String>.from(json['mantra_ids'] as List),
    createdAt: DateTime.parse(json['created_at'] as String),
    isFavorite: json['is_favorite'] as bool? ?? false,
    description: json['description'] as String?,
    isDailyAutoPlay: json['is_daily_auto_play'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'playlist_name': playlistName,
    'mantra_ids': mantraIds,
    'created_at': createdAt.toIso8601String(),
    'is_favorite': isFavorite,
    'description': description,
    'is_daily_auto_play': isDailyAutoPlay,
  };
}

// ─────────────────────────── JAP STATS MODEL ────────────────────────────────

class JapStats {
  final int todayCount;
  final int weekCount;
  final int monthCount;
  final int totalLifetime;
  final int currentStreak;
  final int bestStreak;
  final int bestDayCount;
  final String mostChantedMantra;
  final List<DailyJapData> dailyData;
  final List<WeeklyJapData> weeklyData;
  final List<MonthlyJapData> monthlyData;

  JapStats({
    required this.todayCount,
    required this.weekCount,
    required this.monthCount,
    required this.totalLifetime,
    required this.currentStreak,
    required this.bestStreak,
    required this.bestDayCount,
    required this.mostChantedMantra,
    required this.dailyData,
    required this.weeklyData,
    required this.monthlyData,
  });

  factory JapStats.fromJson(Map<String, dynamic> json) => JapStats(
    todayCount: json['today_count'] as int? ?? 0,
    weekCount: json['week_count'] as int? ?? 0,
    monthCount: json['month_count'] as int? ?? 0,
    totalLifetime: json['total_lifetime'] as int? ?? 0,
    currentStreak: json['current_streak'] as int? ?? 0,
    bestStreak: json['best_streak'] as int? ?? 0,
    bestDayCount: json['best_day_count'] as int? ?? 0,
    mostChantedMantra: json['most_chanted_mantra'] as String? ?? '-',
    dailyData: (json['daily_data'] as List<dynamic>? ?? [])
        .map((e) => DailyJapData.fromJson(e as Map<String, dynamic>))
        .toList(),
    weeklyData: (json['weekly_data'] as List<dynamic>? ?? [])
        .map((e) => WeeklyJapData.fromJson(e as Map<String, dynamic>))
        .toList(),
    monthlyData: (json['monthly_data'] as List<dynamic>? ?? [])
        .map((e) => MonthlyJapData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  factory JapStats.empty() => JapStats(
    todayCount: 0,
    weekCount: 0,
    monthCount: 0,
    totalLifetime: 0,
    currentStreak: 0,
    bestStreak: 0,
    bestDayCount: 0,
    mostChantedMantra: '-',
    dailyData: [],
    weeklyData: [],
    monthlyData: [],
  );
}

class DailyJapData {
  final String date;
  final int count;

  DailyJapData({required this.date, required this.count});

  factory DailyJapData.fromJson(Map<String, dynamic> json) => DailyJapData(
    date: json['date'] as String,
    count: json['count'] as int,
  );
}

class WeeklyJapData {
  final String week;
  final int count;

  WeeklyJapData({required this.week, required this.count});

  factory WeeklyJapData.fromJson(Map<String, dynamic> json) => WeeklyJapData(
    week: json['week'] as String,
    count: json['count'] as int,
  );
}

class MonthlyJapData {
  final String month;
  final int count;

  MonthlyJapData({required this.month, required this.count});

  factory MonthlyJapData.fromJson(Map<String, dynamic> json) => MonthlyJapData(
    month: json['month'] as String,
    count: json['count'] as int,
  );
}

// ─────────────────────────── AUTH MODELS ────────────────────────────────────

class AuthUser {
  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String token;

  AuthUser({
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.token,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
    id: json['id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    photoUrl: json['photo_url'] as String?,
    token: json['token'] as String,
  );
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}

class GoogleAuthRequest {
  final String googleToken;

  GoogleAuthRequest({required this.googleToken});

  Map<String, dynamic> toJson() => {'google_token': googleToken};
}

// ─────────────────────────── API RESPONSE WRAPPER ───────────────────────────

class ApiResponse<T> {
  final bool success;
  final String message;
  final T? data;
  final int? statusCode;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
    this.statusCode,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic)? fromData,
      ) {
    return ApiResponse(
      success: json['success'] as bool? ?? true,
      message: json['message'] as String? ?? '',
      data: fromData != null && json['data'] != null
          ? fromData(json['data'])
          : null,
      statusCode: json['status_code'] as int?,
    );
  }

  factory ApiResponse.error(String message) => ApiResponse(
    success: false,
    message: message,
  );
}
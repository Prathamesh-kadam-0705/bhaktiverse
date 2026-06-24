// lib/shared/services/api_services.dart
// ─── All API Service Classes ──────────────────────────────────────────────

import '../models/app_models.dart';
import '../../core/network/api_client.dart';
import '../../core/constants/app_constants.dart';

// ─────────────────────────── MANTRA API SERVICE ──────────────────────────────

class MantraApiService {
  final ApiClient _client;

  MantraApiService(this._client);

  /// GET /mantras — All mantras
  Future<List<Mantra>> getAllMantras() async {
    final response = await _client.get(AppConstants.endpointMantras);
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list.map((e) => Mantra.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /mantras/{god} — Mantras by god name
  Future<List<Mantra>> getMantrasByGod(String godName) async {
    final response = await _client.get(
      '${AppConstants.endpointMantrasByGod}/$godName',
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list.map((e) => Mantra.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /mantras/{id} — Single mantra
  Future<Mantra> getMantraById(String id) async {
    final response = await _client.get('${AppConstants.endpointMantras}/$id');
    final data = response.data as Map<String, dynamic>;
    return Mantra.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// GET /mantras?search={query}
  Future<List<Mantra>> searchMantras(String query) async {
    final response = await _client.get(
      AppConstants.endpointMantras,
      queryParameters: {'search': query},
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list.map((e) => Mantra.fromJson(e as Map<String, dynamic>)).toList();
  }
}

// ─────────────────────────── GOD API SERVICE ─────────────────────────────────

class GodApiService {
  final ApiClient _client;

  GodApiService(this._client);

  /// GET /gods — All gods
  Future<List<God>> getAllGods() async {
    final response = await _client.get(AppConstants.endpointGods);
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list.map((e) => God.fromJson(e as Map<String, dynamic>)).toList();
  }

  /// GET /gods/{id}
  Future<God> getGodById(String id) async {
    final response = await _client.get('${AppConstants.endpointGods}/$id');
    final data = response.data as Map<String, dynamic>;
    return God.fromJson(data['data'] as Map<String, dynamic>);
  }
}

// ─────────────────────────── SONG API SERVICE ────────────────────────────────

class SongApiService {
  final ApiClient _client;

  SongApiService(this._client);

  /// GET /songs — All songs
  Future<List<DevotionalSong>> getAllSongs({String? category}) async {
    final response = await _client.get(
      AppConstants.endpointSongs,
      queryParameters: category != null ? {'category': category} : null,
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list
        .map((e) => DevotionalSong.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /songs/{god} — Songs by god
  Future<List<DevotionalSong>> getSongsByGod(String godName,
      {String? category}) async {
    final response = await _client.get(
      '${AppConstants.endpointSongsByGod}/$godName',
      queryParameters: category != null ? {'category': category} : null,
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list
        .map((e) => DevotionalSong.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /songs?search={query}
  Future<List<DevotionalSong>> searchSongs(String query) async {
    final response = await _client.get(
      AppConstants.endpointSongs,
      queryParameters: {'search': query},
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list
        .map((e) => DevotionalSong.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /songs/{id}
  Future<DevotionalSong> getSongById(String id) async {
    final response =
    await _client.get('${AppConstants.endpointSongs}/$id');
    final data = response.data as Map<String, dynamic>;
    return DevotionalSong.fromJson(data['data'] as Map<String, dynamic>);
  }
}

// ─────────────────────────── JAP API SERVICE ─────────────────────────────────

class JapApiService {
  final ApiClient _client;

  JapApiService(this._client);

  /// POST /jap/save — Save jap session
  Future<bool> saveJapSession(JapSession session) async {
    final response = await _client.post(
      AppConstants.endpointJapSave,
      data: session.toJson(),
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  /// POST /jap/save — Batch save multiple sessions
  Future<bool> batchSaveJapSessions(List<JapSession> sessions) async {
    final response = await _client.post(
      '${AppConstants.endpointJapSave}/batch',
      data: {'sessions': sessions.map((s) => s.toJson()).toList()},
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  /// GET /jap/history — Jap history
  Future<List<JapSession>> getJapHistory({
    DateTime? from,
    DateTime? to,
    int? limit,
    int? page,
  }) async {
    final params = <String, dynamic>{};
    if (from != null) params['from'] = from.toIso8601String();
    if (to != null) params['to'] = to.toIso8601String();
    if (limit != null) params['limit'] = limit;
    if (page != null) params['page'] = page;

    final response = await _client.get(
      AppConstants.endpointJapHistory,
      queryParameters: params.isNotEmpty ? params : null,
    );
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list
        .map((e) => JapSession.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// GET /jap/stats — Jap statistics
  Future<JapStats> getJapStats({String? period}) async {
    final response = await _client.get(
      AppConstants.endpointJapStats,
      queryParameters: period != null ? {'period': period} : null,
    );
    final data = response.data as Map<String, dynamic>;
    return JapStats.fromJson(data['data'] as Map<String, dynamic>);
  }
}

// ─────────────────────────── PLAYLIST API SERVICE ────────────────────────────

class PlaylistApiService {
  final ApiClient _client;

  PlaylistApiService(this._client);

  /// GET /playlists — All user playlists
  Future<List<Playlist>> getUserPlaylists() async {
    final response = await _client.get(AppConstants.endpointPlaylists);
    final data = response.data as Map<String, dynamic>;
    final list = data['data'] as List<dynamic>;
    return list
        .map((e) => Playlist.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// POST /playlists — Create playlist
  Future<Playlist> createPlaylist(Playlist playlist) async {
    final response = await _client.post(
      AppConstants.endpointPlaylists,
      data: playlist.toJson(),
    );
    final data = response.data as Map<String, dynamic>;
    return Playlist.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// PUT /playlists/{id} — Update playlist
  Future<Playlist> updatePlaylist(Playlist playlist) async {
    final response = await _client.put(
      '${AppConstants.endpointPlaylists}/${playlist.id}',
      data: playlist.toJson(),
    );
    final data = response.data as Map<String, dynamic>;
    return Playlist.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// DELETE /playlists/{id}
  Future<bool> deletePlaylist(String playlistId) async {
    final response = await _client.delete(
      '${AppConstants.endpointPlaylists}/$playlistId',
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }

  /// POST /playlists/{id}/mantras — Add mantra to playlist
  Future<bool> addMantraToPlaylist(String playlistId, String mantraId) async {
    final response = await _client.post(
      '${AppConstants.endpointPlaylists}/$playlistId/mantras',
      data: {'mantra_id': mantraId},
    );
    return response.statusCode == 200 || response.statusCode == 201;
  }

  /// DELETE /playlists/{id}/mantras/{mantraId}
  Future<bool> removeMantraFromPlaylist(
      String playlistId, String mantraId) async {
    final response = await _client.delete(
      '${AppConstants.endpointPlaylists}/$playlistId/mantras/$mantraId',
    );
    return response.statusCode == 200 || response.statusCode == 204;
  }
}

// ─────────────────────────── AUTH API SERVICE ────────────────────────────────

class AuthApiService {
  final ApiClient _client;

  AuthApiService(this._client);

  /// POST /auth/login
  Future<AuthUser> login(String email, String password) async {
    final response = await _client.post(
      '${AppConstants.endpointAuth}/login',
      data: {'email': email, 'password': password},
    );
    final data = response.data as Map<String, dynamic>;
    return AuthUser.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// POST /auth/google — Google OAuth login
  Future<AuthUser> googleLogin(String googleToken) async {
    final response = await _client.post(
      '${AppConstants.endpointAuth}/google',
      data: {'google_token': googleToken},
    );
    final data = response.data as Map<String, dynamic>;
    return AuthUser.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// POST /auth/register
  Future<AuthUser> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      '${AppConstants.endpointAuth}/register',
      data: {'name': name, 'email': email, 'password': password},
    );
    final data = response.data as Map<String, dynamic>;
    return AuthUser.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// POST /auth/logout
  Future<bool> logout() async {
    final response = await _client.post('${AppConstants.endpointAuth}/logout');
    return response.statusCode == 200;
  }

  /// GET /user/profile
  Future<AuthUser> getProfile() async {
    final response = await _client.get('${AppConstants.endpointUser}/profile');
    final data = response.data as Map<String, dynamic>;
    return AuthUser.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// PUT /user/profile — Update profile
  Future<AuthUser> updateProfile({String? name, String? photoUrl}) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (photoUrl != null) body['photo_url'] = photoUrl;

    final response = await _client.put(
      '${AppConstants.endpointUser}/profile',
      data: body,
    );
    final data = response.data as Map<String, dynamic>;
    return AuthUser.fromJson(data['data'] as Map<String, dynamic>);
  }

  /// POST /user/sync — Sync local data to server
  Future<bool> syncData(Map<String, dynamic> localData) async {
    final response = await _client.post(
      '${AppConstants.endpointUser}/sync',
      data: localData,
    );
    return response.statusCode == 200;
  }
}
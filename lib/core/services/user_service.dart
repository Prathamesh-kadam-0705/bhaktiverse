import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
  }) async {

    await _firestore.collection("users").doc(uid).set({

      "uid": uid,

      "name": name,

      "email": email,

      "photoUrl": "",

      "age": 0,

      "gender": "",

      "dailyTarget": 108,

      "todayCount": 0,

      "totalCount": 0,

      "currentStreak": 0,

      "longestStreak": 0,

      "favoriteGods": [],

      "favoriteMantras": [],

      "mostInteractedGods": {},

      "notificationEnabled": true,

      "reminderTime": "07:00 PM",

      "createdAt": FieldValue.serverTimestamp(),

      "updatedAt": FieldValue.serverTimestamp(),

      "lastLogin": FieldValue.serverTimestamp(),
    });
  }
}
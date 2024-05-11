import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../models/user_model.dart';

class FireStoreHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<void> saveUserInFirestore(UserModel userModel) async {
    try {
      await _firestore.collection('users').doc(userModel.email).set(userModel.toJson());
    } catch (e) {
      if (kDebugMode) {
        print("Error creating user collection: $e");
      }
      rethrow;
    }
  }

  static Future<UserModel?> getUserFromFirestore(String email) async {
    try {
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(email).get();
      if (userSnapshot.exists) {
        return UserModel.fromJson(userSnapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error getting user from Firestore: $e");
      }
      rethrow;
    }
  }

  static Future<bool> userExists(String email) async {
    try {
      DocumentSnapshot userSnapshot = await _firestore.collection('users').doc(email).get();
      return userSnapshot.exists;
    } catch (e) {
      if (kDebugMode) {
        print("Error checking if user exists: $e");
      }
      rethrow;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class FireStoreHelper{
  static FirebaseFirestore myCollection = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>?> getUserFromFirestore(
      {required String email}) async {
    var data = await myCollection
        .collection('Users')
        .where(
      'email',
      isEqualTo: email,
    )
        .get();
    var myUser = data.docs.first.data();
    return myUser;
  }

  static Future<void> saveUserInFirestore(UserModel userModel) async {
    await myCollection
        .collection('Users')
        .doc(userModel.email)
        .set(userModel.toJson());
  }

  static Future<bool> userIsExist(String email) async {
    var data = await myCollection
        .collection('Users')
        .where('email', isEqualTo: email)
        .get();
    if (data.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

}
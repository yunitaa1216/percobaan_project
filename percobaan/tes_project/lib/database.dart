import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod{
handleThenable(deleteApp) {
  Future<void> delete() => handleThenable(DatabaseMethod().deleteApp());
} // Panggil metode `handleThenable()` pada objek `DatabaseMethod`
// import 'package:firebase_core_e';
Future addUserDetails(Map<String, dynamic> userInfoMap) async{
  return await FirebaseFirestore.instance
  .collection("users")
  .doc()
  .set(userInfoMap);
}

  deleteApp() {}
}
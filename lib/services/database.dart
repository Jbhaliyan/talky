import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  FirebaseFirestore data = FirebaseFirestore.instance;
  getUser(String username) async {
    return await data
      ..collection("users").where("name", isEqualTo: username).get();
  }

  uploadUserInfo(userMap) {
    data
        .collection("users")
        .add(userMap)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user :$error"));
  }

  createChatRoom(String chatRoomId, chatRoomMap) {
    data
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e.toString());
    });
  }
}

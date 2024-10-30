import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import '../domain/fcm_model.dart';

class FirebaseChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  Future<void> sendMessage(String chatId, MessageModel message) async {
    try {
      await _firestore.collection('chat_dev').doc(chatId).collection('messages').add({
        'senderId': message.senderId,
        'text': message.text,
        'timestamp': message.timestamp,
        'read': message.read,
      });
    } catch (e) {
      print("Error sending message: $e");
      throw e;
    }
  }


  Stream<List<MessageModel>> getMessages(String chatId) {
    return _db.child('chat_dev/$chatId').onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data == null) return [];

      final messagesMap = data.map((key, value) {
        return MapEntry(key.toString(), value as Map<dynamic, dynamic>);
      });

      return messagesMap.entries.map((entry) {
        final messageData = entry.value as Map<String, dynamic>;
        return MessageModel.fromMap(messageData);
      }).toList();
    });
  }

}

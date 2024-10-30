import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String senderId;
  final String text;
  final Timestamp timestamp;
  final bool read;

  MessageModel({
    required this.senderId,
    required this.text,
    required this.timestamp,
    required this.read,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'text': text,
      'timestamp': timestamp,
      'read': read,
    };
  }

  static MessageModel fromMap(Map<String, dynamic> map) {
    return MessageModel(
      senderId: map['senderId'],
      text: map['text'],
      timestamp: map['timestamp'],
      read: map['read'],
    );
  }
}

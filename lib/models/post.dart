import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Post({
    @required this.title,
    this.description,
    this.createdAt,
    this.userRef,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'].toString(),
      description: json['description'].toString(),
      createdAt: json['createdAt'] as Timestamp,
      userRef: json['userRef'] as DocumentReference,
    );
  }

  String title;
  String description;
  Timestamp createdAt;
  DocumentReference userRef;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'title': title,
        'description': description,
        'createdAt': createdAt,
        'userRef': userRef,
      };
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nippo/core/authentication/auth_provider.dart';
import 'package:nippo/core/const.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'user/user.dart';

part 'user_provider.g.dart';

@riverpod
Stream<User?> user(UserRef ref) {
  final firUser = ref.watch(firUserProvider).value;
  return FirebaseFirestore.instance
      .collection(Collection.users)
      .doc(firUser?.uid)
      .withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      )
      .snapshots()
      .map((snapshot) => snapshot.exists ? snapshot.data() : null);
}

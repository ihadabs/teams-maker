import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'member.freezed.dart';
part 'member.g.dart';

@freezed
class Member with _$Member {
  const Member._();
  const factory Member({
    required String id,
    required String name,
    required List<String> preferredMembersIds,
    required List<String> unpreferredMembersIds,
  }) = _Member;

  factory Member.fromJson(Map<String, Object?> json) => _$MemberFromJson(json);

  static CollectionReference<Member> collection() => FirebaseFirestore.instance
      .collection('member')
      .withConverter<Member>(fromFirestore: Member.fromFirestore, toFirestore: Member.toFirestore);

  static Query<Member> collectionOrdered() => FirebaseFirestore.instance
      .collection('member')
      .withConverter<Member>(fromFirestore: Member.fromFirestore, toFirestore: Member.toFirestore)
      .orderBy('name');

  static Member fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    return Member.fromJson(snapshot.data() ?? {});
  }

  static Map<String, Object?> toFirestore(Member value, SetOptions? options) {
    return value.toJson();
  }
}

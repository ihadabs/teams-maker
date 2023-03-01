import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:teams_maker/pages/home_page.dart';

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

  @override
  String toString() {
    return name;
  }

  static CollectionReference<Member> collection() => FirebaseFirestore.instance
      .collection('member')
      .withConverter<Member>(fromFirestore: Member.fromFirestore, toFirestore: Member.toFirestore);

  static Query<Member> _collectionOrdered() => collection().orderBy('name');

  static Member fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    return Member.fromJson(snapshot.data() ?? {});
  }

  static Map<String, Object?> toFirestore(Member value, SetOptions? options) {
    return value.toJson();
  }
}

final _membersProvider = StreamProvider<List<Member>>((ref) {
  return Member._collectionOrdered().toListStream();
});

class MembersStream extends ConsumerWidget {
  const MembersStream({super.key, required this.builder});

  final Widget Function(BuildContext context, List<Member> members) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final liveMembers = ref.watch(_membersProvider);

    return liveMembers.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
      data: (members) {
        return builder(context, members);
      },
    );
  }
}

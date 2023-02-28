import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teams_maker/models/member.dart';

part 'team.freezed.dart';
part 'team.g.dart';

@freezed
class Team with _$Team {
  const Team._();
  const factory Team({
    required String id,
    required String name,
    required List<Member> members,
  }) = _Team;

  factory Team.fromJson(Map<String, Object?> json) => _$TeamFromJson(json);

  static CollectionReference<Team> collection() => FirebaseFirestore.instance
      .collection('team')
      .withConverter<Team>(fromFirestore: Team.fromFirestore, toFirestore: Team.toFirestore);

  static Query<Team> collectionOrdered() => FirebaseFirestore.instance
      .collection('team')
      .withConverter<Team>(fromFirestore: Team.fromFirestore, toFirestore: Team.toFirestore)
      .orderBy('name');

  static Team fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? options) {
    return Team.fromJson(snapshot.data() ?? {});
  }

  static Map<String, Object?> toFirestore(Team value, SetOptions? options) {
    return value.toJson();
  }
}

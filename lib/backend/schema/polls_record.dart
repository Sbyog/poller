import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'schema_util.dart';
import 'serializers.dart';

part 'polls_record.g.dart';

abstract class PollsRecord implements Built<PollsRecord, PollsRecordBuilder> {
  static Serializer<PollsRecord> get serializer => _$pollsRecordSerializer;

  @nullable
  String get pollname;

  @nullable
  @BuiltValueField(wireName: 'choice_a')
  String get choiceA;

  @nullable
  @BuiltValueField(wireName: 'choice_b')
  String get choiceB;

  @nullable
  @BuiltValueField(wireName: 'choice_a_votes')
  int get choiceAVotes;

  @nullable
  @BuiltValueField(wireName: 'choice_b_votes')
  int get choiceBVotes;

  @nullable
  @BuiltValueField(wireName: 'choice_a_perc')
  int get choiceAPerc;

  @nullable
  @BuiltValueField(wireName: 'choice_a_img')
  String get choiceAImg;

  @nullable
  @BuiltValueField(wireName: 'choice_b_img')
  String get choiceBImg;

  @nullable
  @BuiltValueField(wireName: 'choice_b_perc')
  int get choiceBPerc;

  @nullable
  int get totalvotes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PollsRecordBuilder builder) => builder
    ..pollname = ''
    ..choiceA = ''
    ..choiceB = ''
    ..choiceAVotes = 0
    ..choiceBVotes = 0
    ..choiceAPerc = 0
    ..choiceAImg = ''
    ..choiceBImg = ''
    ..choiceBPerc = 0
    ..totalvotes = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('polls');

  static Stream<PollsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PollsRecord._();
  factory PollsRecord([void Function(PollsRecordBuilder) updates]) =
      _$PollsRecord;
}

Map<String, dynamic> createPollsRecordData({
  String pollname,
  String choiceA,
  String choiceB,
  int choiceAVotes,
  int choiceBVotes,
  int choiceAPerc,
  String choiceAImg,
  String choiceBImg,
  int choiceBPerc,
  int totalvotes,
}) =>
    serializers.serializeWith(
        PollsRecord.serializer,
        PollsRecord((p) => p
          ..pollname = pollname
          ..choiceA = choiceA
          ..choiceB = choiceB
          ..choiceAVotes = choiceAVotes
          ..choiceBVotes = choiceBVotes
          ..choiceAPerc = choiceAPerc
          ..choiceAImg = choiceAImg
          ..choiceBImg = choiceBImg
          ..choiceBPerc = choiceBPerc
          ..totalvotes = totalvotes));

PollsRecord get dummyPollsRecord {
  final builder = PollsRecordBuilder()
    ..pollname = dummyString
    ..choiceA = dummyString
    ..choiceB = dummyString
    ..choiceAVotes = dummyInteger
    ..choiceBVotes = dummyInteger
    ..choiceAPerc = dummyInteger
    ..choiceAImg = dummyImagePath
    ..choiceBImg = dummyImagePath
    ..choiceBPerc = dummyInteger
    ..totalvotes = dummyInteger;
  return builder.build();
}

List<PollsRecord> createDummyPollsRecord({int count}) =>
    List.generate(count, (_) => dummyPollsRecord);

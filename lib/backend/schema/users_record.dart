import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get uid;

  @nullable
  int get age;

  @nullable
  LatLng get location;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  String get userTitle;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: 'user_landmark')
  String get userLandmark;

  @nullable
  @BuiltValueField(wireName: 'bus_stop')
  String get busStop;

  @nullable
  @BuiltValueField(wireName: 'mileage_balance')
  double get mileageBalance;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..displayName = ''
    ..email = ''
    ..password = ''
    ..uid = ''
    ..age = 0
    ..phoneNumber = ''
    ..photoUrl = ''
    ..userTitle = ''
    ..address = ''
    ..userLandmark = ''
    ..busStop = ''
    ..mileageBalance = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String displayName,
  String email,
  String password,
  String uid,
  int age,
  LatLng location,
  String phoneNumber,
  String photoUrl,
  DateTime createdTime,
  String userTitle,
  String address,
  String userLandmark,
  String busStop,
  double mileageBalance,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..displayName = displayName
          ..email = email
          ..password = password
          ..uid = uid
          ..age = age
          ..location = location
          ..phoneNumber = phoneNumber
          ..photoUrl = photoUrl
          ..createdTime = createdTime
          ..userTitle = userTitle
          ..address = address
          ..userLandmark = userLandmark
          ..busStop = busStop
          ..mileageBalance = mileageBalance));

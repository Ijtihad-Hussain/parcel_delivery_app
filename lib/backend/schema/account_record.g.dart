// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccountRecord> _$accountRecordSerializer =
    new _$AccountRecordSerializer();

class _$AccountRecordSerializer implements StructuredSerializer<AccountRecord> {
  @override
  final Iterable<Type> types = const [AccountRecord, _$AccountRecord];
  @override
  final String wireName = 'AccountRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, AccountRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.mileageBalance;
    if (value != null) {
      result
        ..add('mileage_balance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  AccountRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccountRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'mileage_balance':
          result.mileageBalance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$AccountRecord extends AccountRecord {
  @override
  final double mileageBalance;
  @override
  final DocumentReference<Object> reference;

  factory _$AccountRecord([void Function(AccountRecordBuilder) updates]) =>
      (new AccountRecordBuilder()..update(updates))._build();

  _$AccountRecord._({this.mileageBalance, this.reference}) : super._();

  @override
  AccountRecord rebuild(void Function(AccountRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccountRecordBuilder toBuilder() => new AccountRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccountRecord &&
        mileageBalance == other.mileageBalance &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, mileageBalance.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AccountRecord')
          ..add('mileageBalance', mileageBalance)
          ..add('reference', reference))
        .toString();
  }
}

class AccountRecordBuilder
    implements Builder<AccountRecord, AccountRecordBuilder> {
  _$AccountRecord _$v;

  double _mileageBalance;
  double get mileageBalance => _$this._mileageBalance;
  set mileageBalance(double mileageBalance) =>
      _$this._mileageBalance = mileageBalance;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  AccountRecordBuilder() {
    AccountRecord._initializeBuilder(this);
  }

  AccountRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mileageBalance = $v.mileageBalance;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccountRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AccountRecord;
  }

  @override
  void update(void Function(AccountRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  AccountRecord build() => _build();

  _$AccountRecord _build() {
    final _$result = _$v ??
        new _$AccountRecord._(
            mileageBalance: mileageBalance, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

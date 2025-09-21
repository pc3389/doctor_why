// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_input_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserInputRequestModel {
  String get gender => throw _privateConstructorUsedError;
  String get preExisting => throw _privateConstructorUsedError;
  String get injuredPart => throw _privateConstructorUsedError;
  String get symptom => throw _privateConstructorUsedError;
  String get painLevel => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Create a copy of UserInputRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserInputRequestModelCopyWith<UserInputRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInputRequestModelCopyWith<$Res> {
  factory $UserInputRequestModelCopyWith(UserInputRequestModel value,
          $Res Function(UserInputRequestModel) then) =
      _$UserInputRequestModelCopyWithImpl<$Res, UserInputRequestModel>;
  @useResult
  $Res call(
      {String gender,
      String preExisting,
      String injuredPart,
      String symptom,
      String painLevel,
      String period});
}

/// @nodoc
class _$UserInputRequestModelCopyWithImpl<$Res,
        $Val extends UserInputRequestModel>
    implements $UserInputRequestModelCopyWith<$Res> {
  _$UserInputRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserInputRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? preExisting = null,
    Object? injuredPart = null,
    Object? symptom = null,
    Object? painLevel = null,
    Object? period = null,
  }) {
    return _then(_value.copyWith(
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      preExisting: null == preExisting
          ? _value.preExisting
          : preExisting // ignore: cast_nullable_to_non_nullable
              as String,
      injuredPart: null == injuredPart
          ? _value.injuredPart
          : injuredPart // ignore: cast_nullable_to_non_nullable
              as String,
      symptom: null == symptom
          ? _value.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as String,
      painLevel: null == painLevel
          ? _value.painLevel
          : painLevel // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInputRequestModelImplCopyWith<$Res>
    implements $UserInputRequestModelCopyWith<$Res> {
  factory _$$UserInputRequestModelImplCopyWith(
          _$UserInputRequestModelImpl value,
          $Res Function(_$UserInputRequestModelImpl) then) =
      __$$UserInputRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gender,
      String preExisting,
      String injuredPart,
      String symptom,
      String painLevel,
      String period});
}

/// @nodoc
class __$$UserInputRequestModelImplCopyWithImpl<$Res>
    extends _$UserInputRequestModelCopyWithImpl<$Res,
        _$UserInputRequestModelImpl>
    implements _$$UserInputRequestModelImplCopyWith<$Res> {
  __$$UserInputRequestModelImplCopyWithImpl(_$UserInputRequestModelImpl _value,
      $Res Function(_$UserInputRequestModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserInputRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = null,
    Object? preExisting = null,
    Object? injuredPart = null,
    Object? symptom = null,
    Object? painLevel = null,
    Object? period = null,
  }) {
    return _then(_$UserInputRequestModelImpl(
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      preExisting: null == preExisting
          ? _value.preExisting
          : preExisting // ignore: cast_nullable_to_non_nullable
              as String,
      injuredPart: null == injuredPart
          ? _value.injuredPart
          : injuredPart // ignore: cast_nullable_to_non_nullable
              as String,
      symptom: null == symptom
          ? _value.symptom
          : symptom // ignore: cast_nullable_to_non_nullable
              as String,
      painLevel: null == painLevel
          ? _value.painLevel
          : painLevel // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserInputRequestModelImpl implements _UserInputRequestModel {
  const _$UserInputRequestModelImpl(
      {required this.gender,
      required this.preExisting,
      required this.injuredPart,
      required this.symptom,
      required this.painLevel,
      required this.period});

  @override
  final String gender;
  @override
  final String preExisting;
  @override
  final String injuredPart;
  @override
  final String symptom;
  @override
  final String painLevel;
  @override
  final String period;

  @override
  String toString() {
    return 'UserInputRequestModel(gender: $gender, preExisting: $preExisting, injuredPart: $injuredPart, symptom: $symptom, painLevel: $painLevel, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInputRequestModelImpl &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.preExisting, preExisting) ||
                other.preExisting == preExisting) &&
            (identical(other.injuredPart, injuredPart) ||
                other.injuredPart == injuredPart) &&
            (identical(other.symptom, symptom) || other.symptom == symptom) &&
            (identical(other.painLevel, painLevel) ||
                other.painLevel == painLevel) &&
            (identical(other.period, period) || other.period == period));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gender, preExisting, injuredPart,
      symptom, painLevel, period);

  /// Create a copy of UserInputRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInputRequestModelImplCopyWith<_$UserInputRequestModelImpl>
      get copyWith => __$$UserInputRequestModelImplCopyWithImpl<
          _$UserInputRequestModelImpl>(this, _$identity);
}

abstract class _UserInputRequestModel implements UserInputRequestModel {
  const factory _UserInputRequestModel(
      {required final String gender,
      required final String preExisting,
      required final String injuredPart,
      required final String symptom,
      required final String painLevel,
      required final String period}) = _$UserInputRequestModelImpl;

  @override
  String get gender;
  @override
  String get preExisting;
  @override
  String get injuredPart;
  @override
  String get symptom;
  @override
  String get painLevel;
  @override
  String get period;

  /// Create a copy of UserInputRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInputRequestModelImplCopyWith<_$UserInputRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

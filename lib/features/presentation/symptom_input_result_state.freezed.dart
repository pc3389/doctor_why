// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_input_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SymptomInputResultState {
  UserInputRequestModel? get userInputRequest =>
      throw _privateConstructorUsedError;

  /// Create a copy of SymptomInputResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymptomInputResultStateCopyWith<SymptomInputResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomInputResultStateCopyWith<$Res> {
  factory $SymptomInputResultStateCopyWith(SymptomInputResultState value,
          $Res Function(SymptomInputResultState) then) =
      _$SymptomInputResultStateCopyWithImpl<$Res, SymptomInputResultState>;
  @useResult
  $Res call({UserInputRequestModel? userInputRequest});
}

/// @nodoc
class _$SymptomInputResultStateCopyWithImpl<$Res,
        $Val extends SymptomInputResultState>
    implements $SymptomInputResultStateCopyWith<$Res> {
  _$SymptomInputResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymptomInputResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInputRequest = freezed,
  }) {
    return _then(_value.copyWith(
      userInputRequest: freezed == userInputRequest
          ? _value.userInputRequest
          : userInputRequest // ignore: cast_nullable_to_non_nullable
              as UserInputRequestModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomInputResultStateImplCopyWith<$Res>
    implements $SymptomInputResultStateCopyWith<$Res> {
  factory _$$SymptomInputResultStateImplCopyWith(
          _$SymptomInputResultStateImpl value,
          $Res Function(_$SymptomInputResultStateImpl) then) =
      __$$SymptomInputResultStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserInputRequestModel? userInputRequest});
}

/// @nodoc
class __$$SymptomInputResultStateImplCopyWithImpl<$Res>
    extends _$SymptomInputResultStateCopyWithImpl<$Res,
        _$SymptomInputResultStateImpl>
    implements _$$SymptomInputResultStateImplCopyWith<$Res> {
  __$$SymptomInputResultStateImplCopyWithImpl(
      _$SymptomInputResultStateImpl _value,
      $Res Function(_$SymptomInputResultStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SymptomInputResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userInputRequest = freezed,
  }) {
    return _then(_$SymptomInputResultStateImpl(
      userInputRequest: freezed == userInputRequest
          ? _value.userInputRequest
          : userInputRequest // ignore: cast_nullable_to_non_nullable
              as UserInputRequestModel?,
    ));
  }
}

/// @nodoc

class _$SymptomInputResultStateImpl implements _SymptomInputResultState {
  const _$SymptomInputResultStateImpl({this.userInputRequest});

  @override
  final UserInputRequestModel? userInputRequest;

  @override
  String toString() {
    return 'SymptomInputResultState(userInputRequest: $userInputRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomInputResultStateImpl &&
            (identical(other.userInputRequest, userInputRequest) ||
                other.userInputRequest == userInputRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userInputRequest);

  /// Create a copy of SymptomInputResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomInputResultStateImplCopyWith<_$SymptomInputResultStateImpl>
      get copyWith => __$$SymptomInputResultStateImplCopyWithImpl<
          _$SymptomInputResultStateImpl>(this, _$identity);
}

abstract class _SymptomInputResultState implements SymptomInputResultState {
  const factory _SymptomInputResultState(
          {final UserInputRequestModel? userInputRequest}) =
      _$SymptomInputResultStateImpl;

  @override
  UserInputRequestModel? get userInputRequest;

  /// Create a copy of SymptomInputResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymptomInputResultStateImplCopyWith<_$SymptomInputResultStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

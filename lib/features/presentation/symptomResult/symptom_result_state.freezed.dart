// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SymptomResultState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of SymptomResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymptomResultStateCopyWith<SymptomResultState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomResultStateCopyWith<$Res> {
  factory $SymptomResultStateCopyWith(
          SymptomResultState value, $Res Function(SymptomResultState) then) =
      _$SymptomResultStateCopyWithImpl<$Res, SymptomResultState>;
  @useResult
  $Res call({List<ChatMessage> messages, dynamic isLoading});
}

/// @nodoc
class _$SymptomResultStateCopyWithImpl<$Res, $Val extends SymptomResultState>
    implements $SymptomResultStateCopyWith<$Res> {
  _$SymptomResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymptomResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomInputStateImplCopyWith<$Res>
    implements $SymptomResultStateCopyWith<$Res> {
  factory _$$SymptomInputStateImplCopyWith(_$SymptomInputStateImpl value,
          $Res Function(_$SymptomInputStateImpl) then) =
      __$$SymptomInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatMessage> messages, dynamic isLoading});
}

/// @nodoc
class __$$SymptomInputStateImplCopyWithImpl<$Res>
    extends _$SymptomResultStateCopyWithImpl<$Res, _$SymptomInputStateImpl>
    implements _$$SymptomInputStateImplCopyWith<$Res> {
  __$$SymptomInputStateImplCopyWithImpl(_$SymptomInputStateImpl _value,
      $Res Function(_$SymptomInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SymptomResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$SymptomInputStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$SymptomInputStateImpl implements _SymptomInputState {
  const _$SymptomInputStateImpl(
      {final List<ChatMessage> messages = const [], this.isLoading = false})
      : _messages = messages;

  final List<ChatMessage> _messages;
  @override
  @JsonKey()
  List<ChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'SymptomResultState(messages: $messages, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomInputStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(isLoading));

  /// Create a copy of SymptomResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomInputStateImplCopyWith<_$SymptomInputStateImpl> get copyWith =>
      __$$SymptomInputStateImplCopyWithImpl<_$SymptomInputStateImpl>(
          this, _$identity);
}

abstract class _SymptomInputState implements SymptomResultState {
  const factory _SymptomInputState(
      {final List<ChatMessage> messages,
      final dynamic isLoading}) = _$SymptomInputStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  dynamic get isLoading;

  /// Create a copy of SymptomResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymptomInputStateImplCopyWith<_$SymptomInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

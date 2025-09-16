// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'symptom_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SymptomInputState {
  List<ChatMessage> get messages => throw _privateConstructorUsedError;
  int get currentQuestionIndex => throw _privateConstructorUsedError;
  bool get isTextInputDisabled => throw _privateConstructorUsedError;
  bool get isNotText => throw _privateConstructorUsedError;
  List<QuestionOption> get currentOptions => throw _privateConstructorUsedError;
  int get selectedOptionIndex => throw _privateConstructorUsedError;
  List<String> get currentArray => throw _privateConstructorUsedError;
  int get selectedArrayIndex => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isQuestionLoading => throw _privateConstructorUsedError;
  bool get allQuestionsCompleted => throw _privateConstructorUsedError;
  Map<int, String> get userAnswers =>
      throw _privateConstructorUsedError; // 질문 인덱스 : 답변
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of SymptomInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SymptomInputStateCopyWith<SymptomInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SymptomInputStateCopyWith<$Res> {
  factory $SymptomInputStateCopyWith(
          SymptomInputState value, $Res Function(SymptomInputState) then) =
      _$SymptomInputStateCopyWithImpl<$Res, SymptomInputState>;
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      int currentQuestionIndex,
      bool isTextInputDisabled,
      bool isNotText,
      List<QuestionOption> currentOptions,
      int selectedOptionIndex,
      List<String> currentArray,
      int selectedArrayIndex,
      bool isLoading,
      bool isQuestionLoading,
      bool allQuestionsCompleted,
      Map<int, String> userAnswers,
      String? error});
}

/// @nodoc
class _$SymptomInputStateCopyWithImpl<$Res, $Val extends SymptomInputState>
    implements $SymptomInputStateCopyWith<$Res> {
  _$SymptomInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SymptomInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? currentQuestionIndex = null,
    Object? isTextInputDisabled = null,
    Object? isNotText = null,
    Object? currentOptions = null,
    Object? selectedOptionIndex = null,
    Object? currentArray = null,
    Object? selectedArrayIndex = null,
    Object? isLoading = null,
    Object? isQuestionLoading = null,
    Object? allQuestionsCompleted = null,
    Object? userAnswers = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isTextInputDisabled: null == isTextInputDisabled
          ? _value.isTextInputDisabled
          : isTextInputDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotText: null == isNotText
          ? _value.isNotText
          : isNotText // ignore: cast_nullable_to_non_nullable
              as bool,
      currentOptions: null == currentOptions
          ? _value.currentOptions
          : currentOptions // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentArray: null == currentArray
          ? _value.currentArray
          : currentArray // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedArrayIndex: null == selectedArrayIndex
          ? _value.selectedArrayIndex
          : selectedArrayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuestionLoading: null == isQuestionLoading
          ? _value.isQuestionLoading
          : isQuestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allQuestionsCompleted: null == allQuestionsCompleted
          ? _value.allQuestionsCompleted
          : allQuestionsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      userAnswers: null == userAnswers
          ? _value.userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SymptomInputStateImplCopyWith<$Res>
    implements $SymptomInputStateCopyWith<$Res> {
  factory _$$SymptomInputStateImplCopyWith(_$SymptomInputStateImpl value,
          $Res Function(_$SymptomInputStateImpl) then) =
      __$$SymptomInputStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ChatMessage> messages,
      int currentQuestionIndex,
      bool isTextInputDisabled,
      bool isNotText,
      List<QuestionOption> currentOptions,
      int selectedOptionIndex,
      List<String> currentArray,
      int selectedArrayIndex,
      bool isLoading,
      bool isQuestionLoading,
      bool allQuestionsCompleted,
      Map<int, String> userAnswers,
      String? error});
}

/// @nodoc
class __$$SymptomInputStateImplCopyWithImpl<$Res>
    extends _$SymptomInputStateCopyWithImpl<$Res, _$SymptomInputStateImpl>
    implements _$$SymptomInputStateImplCopyWith<$Res> {
  __$$SymptomInputStateImplCopyWithImpl(_$SymptomInputStateImpl _value,
      $Res Function(_$SymptomInputStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SymptomInputState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? currentQuestionIndex = null,
    Object? isTextInputDisabled = null,
    Object? isNotText = null,
    Object? currentOptions = null,
    Object? selectedOptionIndex = null,
    Object? currentArray = null,
    Object? selectedArrayIndex = null,
    Object? isLoading = null,
    Object? isQuestionLoading = null,
    Object? allQuestionsCompleted = null,
    Object? userAnswers = null,
    Object? error = freezed,
  }) {
    return _then(_$SymptomInputStateImpl(
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<ChatMessage>,
      currentQuestionIndex: null == currentQuestionIndex
          ? _value.currentQuestionIndex
          : currentQuestionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isTextInputDisabled: null == isTextInputDisabled
          ? _value.isTextInputDisabled
          : isTextInputDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      isNotText: null == isNotText
          ? _value.isNotText
          : isNotText // ignore: cast_nullable_to_non_nullable
              as bool,
      currentOptions: null == currentOptions
          ? _value._currentOptions
          : currentOptions // ignore: cast_nullable_to_non_nullable
              as List<QuestionOption>,
      selectedOptionIndex: null == selectedOptionIndex
          ? _value.selectedOptionIndex
          : selectedOptionIndex // ignore: cast_nullable_to_non_nullable
              as int,
      currentArray: null == currentArray
          ? _value._currentArray
          : currentArray // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedArrayIndex: null == selectedArrayIndex
          ? _value.selectedArrayIndex
          : selectedArrayIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isQuestionLoading: null == isQuestionLoading
          ? _value.isQuestionLoading
          : isQuestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      allQuestionsCompleted: null == allQuestionsCompleted
          ? _value.allQuestionsCompleted
          : allQuestionsCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      userAnswers: null == userAnswers
          ? _value._userAnswers
          : userAnswers // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SymptomInputStateImpl implements _SymptomInputState {
  const _$SymptomInputStateImpl(
      {final List<ChatMessage> messages = const [],
      this.currentQuestionIndex = 0,
      this.isTextInputDisabled = false,
      this.isNotText = false,
      final List<QuestionOption> currentOptions = const [],
      this.selectedOptionIndex = -1,
      final List<String> currentArray = const [],
      this.selectedArrayIndex = -1,
      this.isLoading = false,
      this.isQuestionLoading = false,
      this.allQuestionsCompleted = false,
      final Map<int, String> userAnswers = const {},
      this.error})
      : _messages = messages,
        _currentOptions = currentOptions,
        _currentArray = currentArray,
        _userAnswers = userAnswers;

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
  final int currentQuestionIndex;
  @override
  @JsonKey()
  final bool isTextInputDisabled;
  @override
  @JsonKey()
  final bool isNotText;
  final List<QuestionOption> _currentOptions;
  @override
  @JsonKey()
  List<QuestionOption> get currentOptions {
    if (_currentOptions is EqualUnmodifiableListView) return _currentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentOptions);
  }

  @override
  @JsonKey()
  final int selectedOptionIndex;
  final List<String> _currentArray;
  @override
  @JsonKey()
  List<String> get currentArray {
    if (_currentArray is EqualUnmodifiableListView) return _currentArray;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_currentArray);
  }

  @override
  @JsonKey()
  final int selectedArrayIndex;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isQuestionLoading;
  @override
  @JsonKey()
  final bool allQuestionsCompleted;
  final Map<int, String> _userAnswers;
  @override
  @JsonKey()
  Map<int, String> get userAnswers {
    if (_userAnswers is EqualUnmodifiableMapView) return _userAnswers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_userAnswers);
  }

// 질문 인덱스 : 답변
  @override
  final String? error;

  @override
  String toString() {
    return 'SymptomInputState(messages: $messages, currentQuestionIndex: $currentQuestionIndex, isTextInputDisabled: $isTextInputDisabled, isNotText: $isNotText, currentOptions: $currentOptions, selectedOptionIndex: $selectedOptionIndex, currentArray: $currentArray, selectedArrayIndex: $selectedArrayIndex, isLoading: $isLoading, isQuestionLoading: $isQuestionLoading, allQuestionsCompleted: $allQuestionsCompleted, userAnswers: $userAnswers, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SymptomInputStateImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.currentQuestionIndex, currentQuestionIndex) ||
                other.currentQuestionIndex == currentQuestionIndex) &&
            (identical(other.isTextInputDisabled, isTextInputDisabled) ||
                other.isTextInputDisabled == isTextInputDisabled) &&
            (identical(other.isNotText, isNotText) ||
                other.isNotText == isNotText) &&
            const DeepCollectionEquality()
                .equals(other._currentOptions, _currentOptions) &&
            (identical(other.selectedOptionIndex, selectedOptionIndex) ||
                other.selectedOptionIndex == selectedOptionIndex) &&
            const DeepCollectionEquality()
                .equals(other._currentArray, _currentArray) &&
            (identical(other.selectedArrayIndex, selectedArrayIndex) ||
                other.selectedArrayIndex == selectedArrayIndex) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isQuestionLoading, isQuestionLoading) ||
                other.isQuestionLoading == isQuestionLoading) &&
            (identical(other.allQuestionsCompleted, allQuestionsCompleted) ||
                other.allQuestionsCompleted == allQuestionsCompleted) &&
            const DeepCollectionEquality()
                .equals(other._userAnswers, _userAnswers) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_messages),
      currentQuestionIndex,
      isTextInputDisabled,
      isNotText,
      const DeepCollectionEquality().hash(_currentOptions),
      selectedOptionIndex,
      const DeepCollectionEquality().hash(_currentArray),
      selectedArrayIndex,
      isLoading,
      isQuestionLoading,
      allQuestionsCompleted,
      const DeepCollectionEquality().hash(_userAnswers),
      error);

  /// Create a copy of SymptomInputState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SymptomInputStateImplCopyWith<_$SymptomInputStateImpl> get copyWith =>
      __$$SymptomInputStateImplCopyWithImpl<_$SymptomInputStateImpl>(
          this, _$identity);
}

abstract class _SymptomInputState implements SymptomInputState {
  const factory _SymptomInputState(
      {final List<ChatMessage> messages,
      final int currentQuestionIndex,
      final bool isTextInputDisabled,
      final bool isNotText,
      final List<QuestionOption> currentOptions,
      final int selectedOptionIndex,
      final List<String> currentArray,
      final int selectedArrayIndex,
      final bool isLoading,
      final bool isQuestionLoading,
      final bool allQuestionsCompleted,
      final Map<int, String> userAnswers,
      final String? error}) = _$SymptomInputStateImpl;

  @override
  List<ChatMessage> get messages;
  @override
  int get currentQuestionIndex;
  @override
  bool get isTextInputDisabled;
  @override
  bool get isNotText;
  @override
  List<QuestionOption> get currentOptions;
  @override
  int get selectedOptionIndex;
  @override
  List<String> get currentArray;
  @override
  int get selectedArrayIndex;
  @override
  bool get isLoading;
  @override
  bool get isQuestionLoading;
  @override
  bool get allQuestionsCompleted;
  @override
  Map<int, String> get userAnswers; // 질문 인덱스 : 답변
  @override
  String? get error;

  /// Create a copy of SymptomInputState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SymptomInputStateImplCopyWith<_$SymptomInputStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

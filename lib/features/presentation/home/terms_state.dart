import 'package:freezed_annotation/freezed_annotation.dart';

part 'terms_state.freezed.dart';

@freezed
class TermsState with _$TermsState {
  const factory TermsState({
    @Default(false) bool hasAgreedToTerms, // 사용자가 약관에 동의했는지 여부
    @Default(false) bool isLoading,       // 로딩 중인지 (예: SharedPreferences에서 읽어올 때)
  }) = _TermsState;
}

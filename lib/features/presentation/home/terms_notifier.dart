// features/terms/application/terms_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'terms_state.dart'; // 위에서 정의한 Freezed 상태

// SharedPreferences 키
const String _agreedToTermsKey = 'agreed_to_terms_riverpod';

// NotifierProvider 정의
final termsNotifierProvider = StateNotifierProvider<TermsNotifier, TermsState>((ref) {
  return TermsNotifier();
});

class TermsNotifier extends StateNotifier<TermsState> {
  TermsNotifier() : super(const TermsState()) {
    _loadAgreementStatus(); // 초기화 시 동의 상태 로드
  }

  // SharedPreferences에서 동의 상태 로드
  Future<void> _loadAgreementStatus() async {
    state = state.copyWith(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasAgreed = prefs.getBool(_agreedToTermsKey) ?? false;
      state = state.copyWith(hasAgreedToTerms: hasAgreed, isLoading: false);
    } catch (e) {
      // 오류 처리 (예: 로그 출력)
      state = state.copyWith(isLoading: false);
    }
  }

  // 사용자가 약관에 동의했을 때 호출
  Future<void> agreeToTerms() async {
    state = state.copyWith(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_agreedToTermsKey, true);
      state = state.copyWith(hasAgreedToTerms: true, isLoading: false);
    } catch (e) {
      // 오류 처리
      state = state.copyWith(isLoading: false);
    }
  }

  // 사용자가 약관에 동의하지 않았을 때 호출 (필요하다면)
  // 현재 로직에서는 명시적으로 '동의 안 함'을 저장할 필요는 없지만,
  // 다른 로직을 위해 추가할 수 있습니다.
  Future<void> disagreeToTerms() async {
    // 여기서는 단순히 상태만 false로 변경하거나,
    // SharedPreferences에 false를 명시적으로 저장할 수도 있습니다.
    // state = state.copyWith(hasAgreedToTerms: false);
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setBool(_agreedToTermsKey, false);
    // 현재는 '동의합니다'를 누르기 전까지는 false 상태이므로 특별한 액션이 필요 없을 수 있습니다.
  }

  // (선택 사항) 동의 상태를 초기화하는 메소드 (테스트 또는 특정 로직용)
  Future<void> resetAgreement() async {
    state = state.copyWith(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_agreedToTermsKey);
      state = state.copyWith(hasAgreedToTerms: false, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

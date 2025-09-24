import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// 버튼 클릭
  static Future<void> logButtonClick({
    required String buttonName,
    String? screen,
  }) {
    return _analytics.logEvent(
      name: 'button_click',
      parameters: {
        'button_name': buttonName,
        if (screen != null) 'screen': screen,
      },
    );
  }

  /// 스크린 뷰
  static Future<void> logScreenView({
    required String screenName,
    String? screenClass,
  }) {
    return _analytics.logScreenView(
      screenName: screenName,
      screenClass: screenClass,
    );
  }
  //
  // /// 구매
  // static Future<void> logPurchase({
  //   required String currency,
  //   required double value,
  //   required String transactionId,
  // }) {
  //   return _analytics.logPurchase(
  //     currency: currency,
  //     value: value,
  //     transactionId: transactionId,
  //   );
  // }
}
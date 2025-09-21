enum Severity {
  mild, // 경미한 수준
  moderate, // 보통
  severe, // 심각 (API 응답이 "심각"이므로 severe로 매칭)
  unknown, // 알 수 없거나 매칭되지 않는 경우
}

extension SeverityExtension on Severity {
  String get displayName {
    switch (this) {
      case Severity.mild:
        return '경미'; // 또는 '경미한 수준' 등 UI에 표시할 이름
      case Severity.moderate:
        return '보통';
      case Severity.severe:
        return '심각';
      case Severity.unknown:
        return '정보 없음'; // 또는 '알 수 없음'
      default: // 이론적으로 default는 필요 없지만, 안전을 위해 추가
        return '알 수 없음';
    }
  }

  // API 응답 문자열(한글)을 Severity enum 값으로 변환하는 static 메소드 (선택 사항)
  // 이 함수는 enum 자체의 멤버가 아니라 extension의 static 메소드입니다.
  // 또는 이전처럼 별도의 top-level 함수로 유지해도 됩니다.
  static Severity fromString(String? severityString) {
    if (severityString == null) {
      return Severity.unknown;
    }
    switch (severityString.trim().toLowerCase()) {
      // API 응답이 영어일 경우도 고려
      case '경미':
      case 'mild':
        return Severity.mild;
      case '보통':
      case 'moderate':
        return Severity.moderate;
      case '심각':
      case 'severe':
        return Severity.severe;
      default:
        return Severity.unknown;
    }
  }
}

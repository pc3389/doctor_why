class DiseaseInfo {
  final String name;
  final int probability; // 또는 double, API 응답에 따라

  DiseaseInfo({
    required this.name,
    required this.probability,
  });

  factory DiseaseInfo.fromJson(Map<String, dynamic> json) {
    return DiseaseInfo(
      name: json['이름'] as String? ?? '알 수 없는 질병',
      probability: json['확률'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '이름': name,
      '확률': probability,
    };
  }
}

// item_with_reason.dart (의약품 및 식품에 공통적으로 사용 가능)
class ItemWithReason {
  final String name;
  final String reason;

  ItemWithReason({
    required this.name,
    required this.reason,
  });

  factory ItemWithReason.fromJson(Map<String, dynamic> json) {
    return ItemWithReason(
      name: json['이름'] as String? ?? '알 수 없음',
      reason: json['이유'] as String? ?? '이유 없음',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '이름': name,
      '이유': reason,
    };
  }
}
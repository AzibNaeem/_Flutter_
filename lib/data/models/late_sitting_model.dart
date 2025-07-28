class LateSittingRequest {
  final String reason;
  final bool dinner;
  final bool wantsVan;
  final DateTime timestamp;

  LateSittingRequest({
    required this.reason,
    required this.dinner,
    required this.wantsVan,
    required this.timestamp,
  });

  factory LateSittingRequest.fromJson(Map<String, dynamic> json) {
    return LateSittingRequest(
      reason: json['reason'] ?? '',
      dinner: json['wants_dinner'] ?? false,
      wantsVan: json['wants_van'] ?? false,
      timestamp: DateTime.tryParse(json['request_date'] ?? '')?.add(
        Duration(
          hours: int.tryParse(json['request_time']?.split(":")[0] ?? '0') ?? 0,
          minutes: int.tryParse(json['request_time']?.split(":")[1] ?? '0') ?? 0,
        ),
      ) ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "reason": reason,
      "wants_dinner": dinner,
      "wants_van": wantsVan,
      "request_date": "${timestamp.year}-${timestamp.month.toString().padLeft(2, '0')}-${timestamp.day.toString().padLeft(2, '0')}",
      "request_time": "${timestamp.hour.toString().padLeft(2, '0')}:${timestamp.minute.toString().padLeft(2, '0')}",
    };
  }
}

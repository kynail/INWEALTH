class RetainedThinkingTransfert {
  final List<String> retainedThinkings;

  const RetainedThinkingTransfert({
    required this.retainedThinkings,
  });

  factory RetainedThinkingTransfert.fromJson(Map<String, dynamic> json) {
    return RetainedThinkingTransfert(
      retainedThinkings: List.from(json["pisteReflexion"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "pisteReflexion": retainedThinkings,
    };
  }
}

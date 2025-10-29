class CallStatsModel {
  final int pending;
  final int called;
  final int rescheduled;

  CallStatsModel({
    required this.pending,
    required this.called,
    required this.rescheduled,
  });

  factory CallStatsModel.fromJson(Map json) {
    return CallStatsModel(
      pending: json['pending'] ?? 0,
      called: json['called'] ?? 0,
      rescheduled: json['rescheduled'] ?? 0,
    );
  }

  int get total => pending + called + rescheduled;
}
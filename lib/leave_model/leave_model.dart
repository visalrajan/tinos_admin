
class LeaveDetails {
  LeaveDetails({required this.name, required this.email, required this.date, required this.day_type, required this.leave_type, required this.reason});

  LeaveDetails.fromJson(Map<String, Object?> json)
      : this(
    name: json['name']! as String,
    email: json['email']! as String,
    date: json['date']! as String,
    day_type: json['day-type']! as String,
    leave_type: json['leave-type']! as String,
    reason: json['reason']! as String,
  );

  final String name;
  final String email;
  final String date;
  final String day_type;
  final String leave_type;
  final String reason;

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'email': email,
      'date': date,
      'day-type': day_type,
      'leave-type': leave_type,
      'reason': reason
    };
  }
}
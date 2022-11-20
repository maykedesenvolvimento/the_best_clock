class Alarm {
  String name;
  int hour;
  int minute;
  List<bool> weekdays;

  String get time =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  Alarm({
    required this.name,
    required this.hour,
    required this.minute,
    required this.weekdays,
  });
}

import 'package:flutter/material.dart';
import 'package:the_best_clock/app_colors.dart';
import 'package:the_best_clock/models/alarm.dart';
import 'package:the_best_clock/views/alarm_tile.dart';

class AlarmsScreen extends StatefulWidget {
  const AlarmsScreen({super.key});

  @override
  State<AlarmsScreen> createState() => _AlarmsScreenState();
}

class _AlarmsScreenState extends State<AlarmsScreen> {
  int alarmExpanded = -1;

  final List<Alarm> _alarms = [
    Alarm(
      name: 'Academia',
      hour: 7,
      minute: 30,
      weekdays: [true, true, true, true, true, false, false],
    ),
    Alarm(
      name: 'Lavar o carro',
      hour: 9,
      minute: 0,
      weekdays: [false, false, false, false, false, false, true],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white.withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          title: const Text(
            'Meus alarmes',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: IconButton(
            color: AppColors.primary,
            icon: const Icon(Icons.alarm_add),
            onPressed: () {
              setState(() {
                _alarms.add(
                  Alarm(
                    name: 'Novo alarme',
                    hour: 0,
                    minute: 0,
                    weekdays: [false, false, false, false, false, false, false],
                  ),
                );
              });
            },
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: _alarms.map((alarm) {
              final index = _alarms.indexOf(alarm);
              return AlarmTile(
                alarm: alarm,
                isExpanded: index == alarmExpanded,
                onExpand: () {
                  setState(() {
                    alarmExpanded = alarmExpanded == index ? -1 : index;
                  });
                },
                onUpdated: (alarm) {
                  setState(() {
                    _alarms[index] = alarm;
                  });
                },
                onDeleted: () {
                  setState(() {
                    _alarms.removeAt(index);
                  });
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

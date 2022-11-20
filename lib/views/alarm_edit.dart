import 'package:flutter/material.dart';
import '../models/alarm.dart';

class AlarmEdit extends StatefulWidget {
  final Alarm alarm;
  final Function(Alarm) onUpdated;

  const AlarmEdit({
    super.key,
    required this.alarm,
    required this.onUpdated,
  });

  @override
  State<AlarmEdit> createState() => _AlarmEditState();
}

class _AlarmEditState extends State<AlarmEdit> {
  late final nameController = TextEditingController(text: widget.alarm.name);
  late final timeController = TextEditingController(text: widget.alarm.time);
  late final size = MediaQuery.of(context).size;

  final radius = BorderRadius.circular(5);

  int get hours => int.parse(timeController.text.split(':')[0]);
  int get minutes => int.parse(timeController.text.split(':')[1]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5,
        borderRadius: radius,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
          ),
          width: size.width - 40,
          padding: const EdgeInsets.all(20),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Nome do alarme',
                ),
                controller: nameController,
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Horário',
                ),
                controller: timeController,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                      hour: hours,
                      minute: minutes,
                    ),
                    cancelText: 'Cancelar',
                    helpText: 'Selecione o horário',
                    builder: (context, child) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(
                          alwaysUse24HourFormat: true,
                        ),
                        child: child!,
                      );
                    },
                  ).then((selectedTime) {
                    if (selectedTime != null) {
                      timeController.text =
                          '${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}';
                    }
                  });
                },
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: Navigator.of(context).pop,
                    child: const Text(
                      'Fechar',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        final alarm = widget.alarm;
                        alarm.name = nameController.text;
                        alarm.hour = hours;
                        alarm.minute = minutes;
                        widget.onUpdated(alarm);
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Salvar',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

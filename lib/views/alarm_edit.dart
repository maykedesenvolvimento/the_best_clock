import 'package:flutter/material.dart';
import 'package:the_best_clock/app_colors.dart';
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

  final buttonStyle = ButtonStyle(
    visualDensity: VisualDensity.standard,
    backgroundColor: MaterialStateProperty.all(
      AppColors.secondary,
    ),
  );

  final radius = BorderRadius.circular(5);

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
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: Navigator.of(context).pop,
                    child: const Text(
                      'Fechar',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: buttonStyle,
                      onPressed: () {},
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

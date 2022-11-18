import 'package:flutter/material.dart';
import 'package:the_best_clock/models/alarm.dart';
import '../app_colors.dart';

class AlarmTile extends StatelessWidget {
  final Alarm alarm;
  final bool isExpanded;
  final VoidCallback onExpand;
  final Function(Alarm) onUpdated;
  final VoidCallback onDeleted;
  final VoidCallback onEditClicked;

  AlarmTile({
    super.key,
    required this.alarm,
    required this.isExpanded,
    required this.onExpand,
    required this.onUpdated,
    required this.onDeleted,
    required this.onEditClicked,
  });

  final List<String> initialsOfDays = ['D', 'S', 'T', 'Q', 'Q', 'S', 'S'];

  void toggleDay(int index) {
    alarm.weekdays[index] = !alarm.weekdays[index];
    onUpdated(alarm);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                alarm.name,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                alarm.time,
                style: const TextStyle(
                  color: AppColors.primary,
                ),
              ),
              trailing: IconButton(
                color: AppColors.primary,
                icon: Icon(isExpanded ? Icons.chevron_left : Icons.expand_more),
                onPressed: onExpand,
              ),
            ),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(7, (index) {
                final dayEnabled = alarm.weekdays[index];

                return Expanded(
                  child: InkWell(
                    radius: 14,
                    onTap: () => toggleDay(index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            dayEnabled ? AppColors.primary : Colors.transparent,
                        border: Border.all(
                          color: dayEnabled
                              ? AppColors.primary
                              : Colors.white.withOpacity(0.25),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        initialsOfDays[index],
                        style: TextStyle(
                          color: dayEnabled
                              ? AppColors.secondary
                              : Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
            if (isExpanded)
              Container(
                height: 1,
                color: Colors.white.withOpacity(0.1),
              ),
            if (isExpanded)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: onEditClicked,
                    child: Text(
                      'Editar',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 40,
                    color: Colors.white.withOpacity(0.1),
                  ),
                  TextButton(
                    onPressed: onDeleted,
                    child: Text(
                      'Excluir',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

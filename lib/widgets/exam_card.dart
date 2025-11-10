import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isPassed = exam.isPassed();
    final backgroundColor = isPassed ? Colors.grey[300] : Colors.blue[50];
    final textColor = isPassed ? Colors.grey[600] : Colors.black;

    return Card(
      margin: const EdgeInsets.all(8.0),
      color: backgroundColor,
      child: ListTile(
        leading: Icon(
          Icons.school,
          color: isPassed ? Colors.grey : Colors.blue,
        ),
        title: Text(
          exam.subject,
          style: TextStyle(
            color: textColor,
            decoration: isPassed ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Row(
          children: [
            Icon(Icons.calendar_today, size: 16),
            SizedBox(width: 4),
            Text('${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year}'),
          ],
        ),
        trailing: Icon(
          Icons.location_on,
          color: isPassed ? Colors.grey : Colors.orange,
        ),
        onTap: onTap,
      ),
    );
  }
}

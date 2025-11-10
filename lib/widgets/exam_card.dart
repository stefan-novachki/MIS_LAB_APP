import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    Key? key,
    required this.exam,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(exam.subject),
        subtitle: Text(
          '${exam.dateTime.day}/${exam.dateTime.month}/${exam.dateTime.year} - ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}',
        ),
        trailing: Text(exam.rooms.join(', ')),
        onTap: onTap,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({Key? key}) : super(key: key);

  @override
  State<ExamListScreen> createState() => _ExamListScreenState();
}

class _ExamListScreenState extends State<ExamListScreen> {
  final List<Exam> exams = [
    Exam(
      subject: 'Математика',
      dateTime: DateTime(2025, 12, 12, 09, 00),
      rooms: ['123', '124', '125'],
    ),
    Exam(
      subject: 'Физика',
      dateTime: DateTime(2025, 12, 12, 10, 30),
      rooms: ['201', '202'],
    ),
    Exam(
      subject: 'Англиски јазик',
      dateTime: DateTime(2025, 12, 12, 14, 00),
      rooms: ['101', '102', '103', '104'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 225086 на индекс'),
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return ExamCard(
            exam: exams[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamDetailScreen(exam: exams[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

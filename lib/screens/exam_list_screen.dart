import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatefulWidget {
  const ExamListScreen({Key? key});

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
      subject: 'Енглески',
      dateTime: DateTime(2025, 12, 12, 14, 00),
      rooms: ['101', '102', '103', '104'],
    ),
    Exam(
      subject: 'Хемија',
      dateTime: DateTime(2025, 12, 13, 09, 00),
      rooms: ['301'],
    ),
    Exam(
      subject: 'Биологија',
      dateTime: DateTime(2025, 12, 13, 11, 00),
      rooms: ['302', '303'],
    ),
    Exam(
      subject: 'История',
      dateTime: DateTime(2025, 12, 14, 10, 00),
      rooms: ['104', '105'],
    ),
    Exam(
      subject: 'География',
      dateTime: DateTime(2025, 12, 14, 13, 00),
      rooms: ['201'],
    ),
    Exam(
      subject: 'Информатика',
      dateTime: DateTime(2025, 12, 15, 09, 30),
      rooms: ['405', '406', '407'],
    ),
    Exam(
      subject: 'Филозофија',
      dateTime: DateTime(2025, 12, 15, 15, 00),
      rooms: ['108'],
    ),
    Exam(
      subject: 'Economia',
      dateTime: DateTime(2025, 12, 16, 10, 00),
      rooms: ['109', '110'],
    ),
    Exam(
      subject: 'Психологија',
      dateTime: DateTime(2024, 11, 5, 09, 00),
      rooms: ['111'],
    ),
    Exam(
      subject: 'Социологија',
      dateTime: DateTime(2024, 10, 28, 14, 00),
      rooms: ['112'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final sortedExams = List<Exam>.from(exams);
    sortedExams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 225086 на индекс'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: sortedExams.length,
              itemBuilder: (context, index) {
                return ExamCard(
                  exam: sortedExams[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailScreen(exam: sortedExams[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              border: Border(top: BorderSide(color: Colors.blue)),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Вкупно испити: ${sortedExams.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

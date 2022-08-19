import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';

class LearningHistoryBox extends StatelessWidget {
  const LearningHistoryBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kAccentColor.withOpacity(0.3)),
        color: const Color(0xffECEAF7),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Learning History',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _LearningHistoryTabs(
                  data: 130,
                  title: 'Questions',
                  icon: Icons.question_mark_rounded,
                ),
                _LearningHistoryTabs(
                  data: 10,
                  title: 'Sessions',
                  icon: Icons.person_pin_rounded,
                ),
                _LearningHistoryTabs(
                  data: 20,
                  title: 'Quizzes',
                  icon: Icons.groups_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LearningHistoryTabs extends StatelessWidget {
  const _LearningHistoryTabs({
    Key? key,
    required this.data,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final IconData icon;
  final int data;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                kAccentColor,
                kAccentColor.withOpacity(0.5),
              ],
            ),
          ),
          child: Icon(icon, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 15),
        Text(
          data.toString(),
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: kAccentColor),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(color: kTextGreyColor, fontSize: 16),
        ),
      ],
    );
  }
}

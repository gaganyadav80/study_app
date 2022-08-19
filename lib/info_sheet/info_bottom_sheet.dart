import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';

import 'attempt_quiz.dart';
import 'learning_history_box.dart';

class InfoBottomSheet extends StatelessWidget {
  const InfoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              width: 270,
              decoration: const BoxDecoration(
                color: kAccentColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              ),
              child: const Center(
                child: Text(
                  'STUDY TIME: 02:32:40',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const LearningHistoryBox(),
            const SizedBox(height: 20),
            const AttemptQuizBox(),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: kAccentColor),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'CLOSE',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

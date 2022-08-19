library study_app;

import 'package:flutter/material.dart';
import 'package:study_app/info_sheet/info_bottom_sheet.dart';
import 'package:study_app/topic_sheet/topic_bottom_sheet.dart';

void showTopicBottomSheet(BuildContext context, {bool showFullList = false}) async {
  await showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (_) {
      return TopicBottomSheet(showFullList: showFullList);
    },
  );
}

void showInfoBottomSheet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    isScrollControlled: true,
    builder: (_) => const FractionallySizedBox(
      heightFactor: 0.83,
      child: InfoBottomSheet(),
    ),
  );
}

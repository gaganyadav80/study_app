import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';
import 'package:study_app/constants.dart';

class TopicListWidget extends StatelessWidget {
  const TopicListWidget({Key? key, required this.topicsList, required this.listType, this.showFullList = false})
      : super(key: key);

  final List<String> topicsList;
  final ListType listType;
  final bool showFullList;

  @override
  Widget build(BuildContext context) {
    return topicsList.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 140),
              const SizedBox(height: 20),
              Text(
                getEmptyListString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          )
        : ListView.builder(
            itemCount: showFullList
                ? topicsList.length
                : topicsList.length < 4
                    ? topicsList.length
                    : 4,
            shrinkWrap: true,
            physics: !showFullList ? const NeverScrollableScrollPhysics() : null,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(topicsList[index], style: const TextStyle(fontSize: 12)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                trailing: SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: getTopicButtonColor(),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text('Start Practice'),
                  ),
                ),
                onTap: () {},
              );
            },
          );
  }

  String getEmptyListString() {
    switch (listType) {
      case ListType.mastered:
        return "You haven't mastered any topic";
      case ListType.weak:
        return "You don't have any weak topic";
      case ListType.uncovered:
        return "You don't have any uncovered topic";
    }
  }

  Color getTopicButtonColor() {
    switch (listType) {
      case ListType.mastered:
        return kMasteredTopicButtonColor;
      case ListType.weak:
        return kWeakTopicButtonColor;
      case ListType.uncovered:
        return kUncoveredTopicButtonColor;
    }
  }
}

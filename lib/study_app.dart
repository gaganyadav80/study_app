library study_app;

import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';
import 'package:study_app/constants.dart';

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

class TopicBottomSheet extends StatefulWidget {
  const TopicBottomSheet({Key? key, this.showFullList = false}) : super(key: key);

  final bool showFullList;

  @override
  State<TopicBottomSheet> createState() => _TopicBottomSheetState();
}

class _TopicBottomSheetState extends State<TopicBottomSheet> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 13),
            // isScrollable: true,
            labelPadding: EdgeInsets.zero,
            unselectedLabelColor: Colors.grey[600],
            labelColor: Colors.black,
            indicatorColor: kAccentColor,
            tabs: [
              Tab(text: 'Mastered (${masteredTopicsList.length})'),
              Tab(text: 'Weak (${weakTopicsList.length})'),
              Tab(text: 'Uncovered (${uncoveredTopicsList.length})'),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TopicList(topicsList: masteredTopicsList, listType: ListType.mastered),
                TopicList(topicsList: weakTopicsList, listType: ListType.weak),
                TopicList(topicsList: uncoveredTopicsList, listType: ListType.uncovered),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: kAccentColor),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('See All', style: TextStyle(fontSize: 16)),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicList extends StatelessWidget {
  const TopicList({Key? key, required this.topicsList, required this.listType, this.showFullList = false})
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

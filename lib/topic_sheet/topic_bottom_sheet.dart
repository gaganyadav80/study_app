import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';
import 'package:study_app/constants.dart';

import 'topic_list_widget.dart';

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
              children: [
                TopicListWidget(
                  topicsList: masteredTopicsList,
                  listType: ListType.mastered,
                  showFullList: widget.showFullList,
                ),
                TopicListWidget(
                  topicsList: weakTopicsList,
                  listType: ListType.weak,
                  showFullList: widget.showFullList,
                ),
                TopicListWidget(
                  topicsList: uncoveredTopicsList,
                  listType: ListType.uncovered,
                  showFullList: widget.showFullList,
                ),
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

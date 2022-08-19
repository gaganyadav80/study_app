import 'package:flutter/material.dart';
import 'package:study_app/colors.dart';

class AttemptQuizBox extends StatelessWidget {
  const AttemptQuizBox({Key? key}) : super(key: key);

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
        children: [
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Incorrect Questions Stats:',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                '40 Questions',
                style: TextStyle(color: kTextGreyColor, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const _AttemptQuizTiles(iconAsset: 'https://picsum.photos/200', question: 10, topic: 'Geography'),
          const SizedBox(height: 20),
          const _AttemptQuizTiles(iconAsset: 'https://picsum.photos/200', question: 10, topic: 'Science & Tech'),
          const SizedBox(height: 20),
          const _AttemptQuizTiles(iconAsset: 'https://picsum.photos/200', question: 20, topic: 'Indian History'),
        ],
      ),
    );
  }
}

class _AttemptQuizTiles extends StatelessWidget {
  const _AttemptQuizTiles({
    Key? key,
    required this.iconAsset,
    required this.question,
    required this.topic,
  }) : super(key: key);

  final String iconAsset;
  final String topic;
  final int question;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kAccentColor.withOpacity(0.3)),
        color: const Color(0xffF2F1F8),
      ),
      child: ListTile(
        leading: CircleAvatar(
          // TODO: change to AssetImage to use local assets
          backgroundImage: NetworkImage(iconAsset),
        ),
        title: Text(topic, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text('$question Questions', style: const TextStyle(fontSize: 12)),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: kAccentColor, elevation: 0),
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text('Retry'),
              SizedBox(width: 5),
              Icon(Icons.arrow_forward_ios, size: 12),
            ],
          ),
        ),
      ),
    );
  }
}

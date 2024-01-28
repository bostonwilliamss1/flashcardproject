import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/methods.dart';

class TopicsTile extends StatelessWidget {
  const TopicsTile({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        loadSession(context: context, topic: topic);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 82, 160, 225),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Hero(
                  tag: topic,
                  child: Image.asset(
                  'assets/images/$topic.png',
                  width: 50.0,
                  height: 50.0,
                ),),
              ),
            ),
            Expanded(
              child: Text(topic),
            ),
          ],
        ),
      ),
    );
  }
}

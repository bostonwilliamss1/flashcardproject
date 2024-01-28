import 'package:flutter/material.dart';
import 'package:flutter_application_1/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/components/flashcards_page/card1.dart';
import 'package:flutter_application_1/components/flashcards_page/card2.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashcardsNotifier = Provider.of<FlashcardsNotifier>(context, listen: false);
      flashcardsNotifier.runSlideCard1();
      flashcardsNotifier.generateAllSelectedWords();
      flashcardsNotifier.generateCurrentWord();
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __ ) => Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(notifier.topic),
        actions: [ Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Hero(
          tag: notifier.topic,
          child: Image.asset('assets/images/${notifier.topic}.png'),
            ),),
          ],
        ),
      body: IgnorePointer(
        ignoring: notifier.ignoreTouches,
      child: const Stack(
        children: [
          Card2(),
          Card1(),
        ]
      ),
      ),
      ),
    );
  }
}


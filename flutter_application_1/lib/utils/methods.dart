import 'package:flutter/material.dart';
import 'package:flutter_application_1/notifiers/flashcards_notifier.dart';
import 'package:flutter_application_1/pages/flashcards_page.dart';
import 'package:provider/provider.dart';

void loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: topic);
  }


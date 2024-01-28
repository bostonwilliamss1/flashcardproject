import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/slide_direction.dart';
import 'package:flutter_application_1/models/word.dart';
import 'package:flutter_application_1/data/words.dart';
import 'dart:math';

class FlashcardsNotifier extends ChangeNotifier {
  String topic = "";
  Word word1 = Word(topic: "", english: "", spanish: "");
  Word word2 = Word(topic: "", english: "", spanish: "");
  List<Word> selectedWords = [];

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == topic).toList();
  }

  generateCurrentWord(){
    if (selectedWords.isNotEmpty){
    final r = Random().nextInt(selectedWords.length);
    word1 = selectedWords[r];
    selectedWords.removeAt(r);
    }
    else{
      print("All words selected");
    }
    
    Future.delayed(const Duration(milliseconds: 600), () {
    word2 = word1;
  });
  }

  /// animation code 

  SlideDirection swipedDirection = SlideDirection.none;

  bool slide1 = false, flipCard1 = false, flipCard2 = false, swipedCard2 = false;
  bool resetSlideCard1 = false, resetFlipCard1 = false, resetFlipCard2 = false, resetSwipeCard2 = false;
  bool ignoreTouches = true;

  runSlideCard1(){
    resetSlideCard1 = false;
    slide1 = true;
    notifyListeners();
  }

  runFlipCard1(){
    resetFlipCard1 = false;
    flipCard1 = true;
    notifyListeners();
  }

  resetCard1() {
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slide1 = false;
    flipCard1 = false;
  }

  runFlipCard2(){
    resetFlipCard2 = false;
    flipCard2 = true;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}){
    resetSwipeCard2 = false;
    swipedDirection = direction;
    swipedCard2 = true;
    notifyListeners();
  }

  resetCard2() {
    resetFlipCard2 = true;
    resetSwipeCard2 = true;
    flipCard2 = false;
    swipedCard2 = false;
  }

  setIgnoreTouch({required bool ignore}){
    ignoreTouches = ignore;
    notifyListeners();
  }

}
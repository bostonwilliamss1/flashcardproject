import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/half_flip_animation.dart';
import 'package:flutter_application_1/enums/slide_direction.dart';
import 'package:flutter_application_1/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/animations/slide_animations.dart';
import 'dart:math';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
    builder: (_, notifier, __) => GestureDetector(
      onHorizontalDragEnd: (details){      
        if (details.primaryVelocity! > 100){
          notifier.runSwipeCard2(direction: SlideDirection.leftAway);
          notifier.runSlideCard1();
          notifier.setIgnoreTouch(ignore: true);
          notifier.generateCurrentWord();
        }
        if (details.primaryVelocity! < -100){
          notifier.runSwipeCard2(direction: SlideDirection.rightAway);
          notifier.runSlideCard1();
          notifier.setIgnoreTouch(ignore: true);
          notifier.generateCurrentWord();
        }
      },
    child: HalfFlipAnimation(
      animate: notifier.flipCard2,
      reset: notifier.resetFlipCard2,
      flipFromHalfWay: true,
      animationCompleted: (){
        notifier.setIgnoreTouch(ignore: false);
      },
    child: SlideAnimations(
      animationCompleted: (){
        notifier.resetCard2();
      },
      reset: notifier.resetSwipeCard2,
      animate: notifier.swipedCard2,
      direction: notifier.swipedDirection,
      child: Center(
      child: Container(
      width: size.width * 0.90,
      height: size.height * .70,
      decoration: BoxDecoration(
        border: Border.all(
        color: Colors.black,
        width: 5,
        ),
        borderRadius: BorderRadius.circular(30),
        color: Colors.blue,
      ),
      child: Transform(
        alignment: Alignment.center,
      transform: Matrix4.rotationY(pi),
      child: Center(
      child: Text(
        notifier.word2.spanish,
        style: const TextStyle(
        fontSize: 24, // Adjust the font size as needed
        ),
      ),
    ),
      ),
      ),
    ),
    ),
    ),
    ),
    );
  }
}
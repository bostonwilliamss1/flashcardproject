import 'package:flutter/material.dart';
import 'package:flutter_application_1/animations/half_flip_animation.dart';
import 'package:flutter_application_1/enums/slide_direction.dart';
import 'package:flutter_application_1/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/animations/slide_animations.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
    builder: (_, notifier, __) => GestureDetector(
      onDoubleTap: (){
        notifier.runFlipCard1();
        notifier.setIgnoreTouch(ignore: true);
      },
    child: HalfFlipAnimation(
      animate: notifier.flipCard1,
      reset: notifier.resetFlipCard1,
      flipFromHalfWay: false,
      animationCompleted: (){
        notifier.resetCard1();
        notifier.runFlipCard2();
      },
    child: SlideAnimations(
      animationCompleted: (){
        notifier.setIgnoreTouch(ignore: false);
      },
      reset: notifier.resetSlideCard1,
      animate: notifier.slide1,
      direction: SlideDirection.upIn,
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
      child: Center(
      child: Text(
        notifier.word1.english,
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
    );
  }
}
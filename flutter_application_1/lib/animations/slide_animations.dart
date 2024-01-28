import 'package:flutter/material.dart';
import 'package:flutter_application_1/enums/slide_direction.dart';

class SlideAnimations extends StatefulWidget {
  const SlideAnimations({required this.child, required this.direction, this.animate = true, this.reset, this.animationCompleted, Key? key}) : super(key: key);

  final Widget child;
  final SlideDirection direction;
  final bool animate;
  final bool? reset; 
  final VoidCallback? animationCompleted;

  @override
  State<SlideAnimations> createState() => _SlideAnimationsState();
}

class _SlideAnimationsState extends State<SlideAnimations> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this)..addListener(() {
        if(_animationController.isCompleted){
          widget.animationCompleted?.call();
        }
      });

    
    if (widget.animate){
    _animationController.forward();
    }
    super.initState();
  }
  
  @override
  void didUpdateWidget(covariant oldWidget) {
    if (widget.reset == true){
      _animationController.reset();
    }
    if (widget.animate){
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
    dispose(){
      _animationController.dispose();
      super.dispose();
  }

  @override

  Widget build(BuildContext context) {
    late final Animation<Offset> _animation;
    Tween<Offset> tween;

    switch(widget.direction) {
      case SlideDirection.leftAway: 
      tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-1, 0));
      break;
      case SlideDirection.rightAway: 
      tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(1, 0));
      break;
      case SlideDirection.leftIn: 
      tween = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
      break;
      case SlideDirection.rightIn: 
      tween = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
      break;
      case SlideDirection.upIn: 
      tween = Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0));
      break;
      case SlideDirection.none: 
      tween = Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0));
      break;
    }

    _animation = tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(position: _animation,
    child: widget.child,);
  }
}
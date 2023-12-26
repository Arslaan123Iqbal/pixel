import 'dart:async';

import 'package:flame/components.dart';
import 'package:todo/adventure.dart';

enum PalyerState { idle, running }

class Player extends SpriteAnimationGroupComponent with HasGameRef<Adventure> {
  late final SpriteAnimation idelAnimation;
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;

  String character;
  Player({postion, required this.character}):super(position: postion);

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimations();
    return super.onLoad();
  }

  void _loadAllAnimations() {
    idelAnimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);
    //List of all animations
    animations = {
      PalyerState.idle: idelAnimation,
      PalyerState.running: runningAnimation
    };

    // Set current animations
    current = PalyerState.running;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
        game.images.fromCache('Main Characters/$character/$state (32x32).png'),
        SpriteAnimationData.sequenced(
            amount: amount, stepTime: stepTime, textureSize: Vector2.all(32)));
  }
}

import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:todo/levels/level.dart';

class Adventure extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;
  @override
  final world = Level(levelName: 'level-2');
  @override
  FutureOr<void> onLoad() async {

    //load all image in cache
    await images.loadAllImages();
    cam = CameraComponent.withFixedResolution(
        world: world, height: 360, width: 640);
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
    return super.onLoad();
  }
}

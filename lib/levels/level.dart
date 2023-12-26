import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:todo/actors/player.dart';

class Level extends World{
  final String levelName;
  Level({required this.levelName});

  late TiledComponent level;
  @override
  FutureOr<void> onLoad() async{
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));
    add(level);

    final spawnPointslayer = level.tileMap.getLayer<ObjectGroup>('spawnpoints');
    for (final spawnPoint in spawnPointslayer!.objects) {
      switch (spawnPoint.class_) {
        case 'Player':
          final player  = Player(character: "Ninja Frog", postion: Vector2(spawnPoint.x, spawnPoint.y));
          add(player);
          break;
        default:
      }
    }
  
    return super.onLoad();
  }
}
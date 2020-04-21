import 'dart:ui';

import 'package:langaw/langaw-game.dart';
import 'package:flame/sprite.dart';

class Fly {

  final LangawGame game;
  Rect flyRect;

  bool isDead = false;
  bool isOffScreen = false;

  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
    }

    if (flyRect.top > game.screenSize.height) {
      isOffScreen = true;
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }
}

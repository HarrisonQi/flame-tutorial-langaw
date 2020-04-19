import 'package:flame/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:langaw/langaw-game.dart';
import 'package:flutter/gestures.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  LangawGame game = LangawGame();

  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = game.onTapDown;
  flameUtil.addGestureRecognizer(tapper);

  runApp(game.widget);
}

import 'dart:async';
import 'dart:ui';

import 'package:dasar_flame/component/asteroid.dart';
import 'package:dasar_flame/component/asteroid_spawner.dart';
import 'package:dasar_flame/component/ship.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:dasar_flame/component/bgParallaxComponent.dart';

class MyFlameGame extends FlameGame with PanDetector {
  late Ship s;
  late Bgparallaxcomponent bgParallax;
  late AsteroidSpawner asp;

  //Menambahkan backgorund dengan warna
  @override
  Color backgroundColor() {
    return const Color(0xFF000045);
  }

  @override
  void update(double dt) {
    bgParallax.changeSpeedBasedShip(s);
    super.update(dt);
  }

  @override
  FutureOr<void> onLoad() async {
    bgParallax = Bgparallaxcomponent();
    add(bgParallax);

    s = Ship();
    add(s);

    asp = AsteroidSpawner();
    add(asp);
  }

  // (layar+objek di klik bisa bergerak)
  // @override
  // void onTapDown(TapDownEvent event) {
  //   s.position.add(Vector2(10, 0));
  // }

  // (objek bergerak mengikuti kursos bila ditekan)
  @override
  void onPanUpdate(DragUpdateInfo info) {
    //s.position = info.eventPosition.global;
    s.setTujuan(info);
  }
}

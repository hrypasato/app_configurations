
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'animation_controller.g.dart';

@Riverpod(keepAlive: true)
class AppAnimationController  extends _$AppAnimationController  {

  @override
  bool build() {
    return true; //animation enabled
  }

  void toggleAnimation(bool value) {
    state = value;
  }

}
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/man_model.dart';

class MyMan extends StateNotifier<Man> {
  MyMan({required this.weight})
      : super(
          Man(
            breathing: 'initial',
            pulse: 'initial',
            mask: 'initial',
            tube: 'initial',
          ),
        ) {
    state = state.copyWith(
      breathing: setBreathing(weight),
      pulse: setPulse(weight),
      mask: setMaska(weight),
      tube: setTube(weight),
    );
  }
  final int weight;

  void showMan() {
    state = state.copyWith(
      breathing: setBreathing(weight),
      pulse: setPulse(weight),
      mask: setMaska(weight),
      tube: setTube(weight),
    );
  }

  String setBreathing(int weight) {
    switch (weight) {
      case 0:
        return '30 - 50/min';
      case 1:
        return '20 - 30/min';
      case 2:
        return '12 - 30/min';
      default:
        return 'Default';
    }
  }

  String setPulse(int weight) {
    switch (weight) {
      case 0:
        return '110 - 180/min';
      case 1:
        return '70 - 140/min';
      case 2:
        return '60 - 130/min';
      default:
        return 'Default';
    }
  }

  String setMaska(int weight) {
    switch (weight) {
      case 0:
        return 'Maska 1';
      case 1:
        return 'Maska 4';
      case 2:
        return 'Maska 5';
      default:
        return 'Default';
    }
  }

  String setTube(int weight) {
    switch (weight) {
      case 0:
        return 'Rurka 1';
      case 1:
        return 'Rurka 4';
      case 2:
        return 'Rurka 5';
      default:
        return 'Default';
    }
  }
}

final manProvider = StateNotifierProvider.family<MyMan, Man, int>(
    (ref, weight) => MyMan(weight: weight));

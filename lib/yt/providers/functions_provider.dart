import 'package:drawing_tutorial/yt/models/correct_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Functions extends StateNotifier<Man> {
  Functions({required this.weight})
      : super(
          Man(
            breathing: 'jgh',
            pulse: 'poj',
            mask: 'kjh',
          ),
        );
  final int weight;

  void showMan() {
    state = state.copyWith(
        breathing: setBreathing(weight),
        pulse: setPulse(weight),
        mask: setMaska(weight));
  }

  String setBreathing(int weight) {
    switch (weight) {
      case 5:
        return '30 - 50/min';
      case 20:
        return '20 - 30/min';
      default:
        return 'Default';
    }
  }

  String setPulse(int weight) {
    switch (weight) {
      case 5:
        return '110 - 180/min';
      case 20:
        return '70 - 140/min';
      default:
        return 'Default';
    }
  }

  String setMaska(int weight) {
    switch (weight) {
      case 5:
        return 'Maska 1';
      case 20:
        return 'Maska 4';
      default:
        return 'Default';
    }
  }
}

final manProvider = StateNotifierProvider.family<Functions, Man, int>(
    (ref, weight) => Functions(weight: weight));

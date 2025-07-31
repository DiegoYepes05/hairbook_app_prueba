import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'credit_provider.g.dart';

@riverpod
class Credit extends _$Credit {
  @override
  int build() => 20;

  void addCredits(int amount) {
    state += amount;
  }

  void deductCredits(int amount) {
    if (state >= amount) {
      state -= amount;
    } else {
      throw Exception('No hay créditos suficientes');
    }
  }

  void reset([int initial = 20]) {
    state = initial;
  }
}

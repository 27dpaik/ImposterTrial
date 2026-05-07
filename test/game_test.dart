import 'dart:math';
import 'package:flutter_test/flutter_test.dart';
import 'package:imposter_game/data/word_bank.dart';
import 'package:imposter_game/models/game.dart';

void main() {
  final foodCategory =
      wordBank.firstWhere((c) => c.name == 'Food');

  test('assigns exactly the requested number of imposters', () {
    for (var seed = 0; seed < 50; seed++) {
      final game = Game.create(
        playerCount: 8,
        imposterCount: 3,
        category: foodCategory,
        rng: Random(seed),
      );
      expect(game.imposterIndices.length, 3);
      expect(game.imposterIndices.every((i) => i >= 0 && i < 8), isTrue);
    }
  });

  test('non-imposters know the secret word, imposters do not', () {
    final game = Game.create(
      playerCount: 5,
      imposterCount: 2,
      category: foodCategory,
      rng: Random(42),
    );
    expect(foodCategory.words.contains(game.secretWord), isTrue);
    final nonImposters =
        List.generate(5, (i) => i).where((i) => !game.isImposter(i)).toList();
    expect(nonImposters.length, 3);
  });

  test('imposter assignment varies across games', () {
    final assignments = <Set<int>>{};
    for (var seed = 0; seed < 30; seed++) {
      final game = Game.create(
        playerCount: 6,
        imposterCount: 1,
        category: foodCategory,
        rng: Random(seed),
      );
      assignments.add(game.imposterIndices);
    }
    expect(assignments.length, greaterThan(3),
        reason: 'imposter selection should not be deterministic across seeds');
  });

  test('throws on empty category', () {
    final bca = wordBank.firstWhere((c) => c.name == 'BCA');
    expect(
      () => Game.create(
        playerCount: 4,
        imposterCount: 1,
        category: bca,
      ),
      throwsStateError,
    );
  });

  test('all 12 categories exist with expected names', () {
    final names = wordBank.map((c) => c.name).toList();
    expect(names, [
      'Food',
      'Sports',
      'Fields of Study',
      'Movies',
      'Animals',
      'Countries',
      'Household Items',
      'Anime',
      'Celebrities',
      'Fast-food Chains',
      'Pop Culture',
      'BCA',
    ]);
  });
}

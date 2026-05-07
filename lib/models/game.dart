import 'dart:math';
import '../data/word_bank.dart';

class Game {
  final int playerCount;
  final int imposterCount;
  final Category category;
  final String secretWord;
  final Set<int> imposterIndices;

  Game._({
    required this.playerCount,
    required this.imposterCount,
    required this.category,
    required this.secretWord,
    required this.imposterIndices,
  });

  factory Game.create({
    required int playerCount,
    required int imposterCount,
    required Category category,
    Random? rng,
  }) {
    final r = rng ?? Random.secure();
    if (category.words.isEmpty) {
      throw StateError('Category "${category.name}" has no words.');
    }
    final word = category.words[r.nextInt(category.words.length)];

    final indices = List<int>.generate(playerCount, (i) => i)..shuffle(r);
    final imposters = indices.take(imposterCount).toSet();

    return Game._(
      playerCount: playerCount,
      imposterCount: imposterCount,
      category: category,
      secretWord: word,
      imposterIndices: imposters,
    );
  }

  bool isImposter(int playerIndex) => imposterIndices.contains(playerIndex);

  List<int> get sortedImposters =>
      imposterIndices.toList()..sort();
}

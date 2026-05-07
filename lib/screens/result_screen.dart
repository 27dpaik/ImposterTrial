import 'package:flutter/material.dart';
import '../models/game.dart';
import 'reveal_screen.dart';

class ResultScreen extends StatefulWidget {
  final Game game;
  const ResultScreen({super.key, required this.game});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _revealed = false;

  void _playAgain() {
    final next = Game.create(
      playerCount: widget.game.playerCount,
      imposterCount: widget.game.imposterCount,
      category: widget.game.category,
    );
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => RevealScreen(game: next)),
    );
  }

  void _newGame() {
    Navigator.of(context).popUntil((r) => r.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: _revealed ? _buildRevealed() : _buildDiscussion(),
        ),
      ),
    );
  }

  Widget _buildDiscussion() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        const Text(
          'DISCUSS',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w900,
            letterSpacing: 6,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Take turns giving one-word clues.\nThen vote on who you think is the imposter.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.75),
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const Spacer(),
        FilledButton(
          onPressed: () => setState(() => _revealed = true),
          child: const Text('REVEAL IMPOSTER'),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: _newGame,
          child: const Text('Back to setup'),
        ),
      ],
    );
  }

  Widget _buildRevealed() {
    final imposters = widget.game.sortedImposters;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Text(
          imposters.length == 1 ? 'THE IMPOSTER WAS' : 'THE IMPOSTERS WERE',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            for (final i in imposters)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFF7F1D1D),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  'PLAYER ${i + 1}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 36),
        Text(
          'THE WORD WAS',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.game.secretWord,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
        Text(
          'Category: ${widget.game.category.name}',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 14,
          ),
        ),
        const Spacer(),
        FilledButton(
          onPressed: _playAgain,
          child: const Text('PLAY AGAIN'),
        ),
        const SizedBox(height: 12),
        TextButton(
          onPressed: _newGame,
          child: const Text('Back to setup'),
        ),
      ],
    );
  }
}

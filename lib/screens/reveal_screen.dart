import 'package:flutter/material.dart';
import '../models/game.dart';
import 'result_screen.dart';

class RevealScreen extends StatefulWidget {
  final Game game;
  const RevealScreen({super.key, required this.game});

  @override
  State<RevealScreen> createState() => _RevealScreenState();
}

enum _Phase { pass, revealed }

class _RevealScreenState extends State<RevealScreen> {
  int _playerIndex = 0;
  _Phase _phase = _Phase.pass;

  void _onTap() {
    setState(() {
      if (_phase == _Phase.pass) {
        _phase = _Phase.revealed;
      } else {
        if (_playerIndex + 1 >= widget.game.playerCount) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => ResultScreen(game: widget.game)),
          );
        } else {
          _playerIndex += 1;
          _phase = _Phase.pass;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final playerNumber = _playerIndex + 1;
    final isLast = _playerIndex + 1 >= widget.game.playerCount;
    final isImposter = widget.game.isImposter(_playerIndex);

    return Scaffold(
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          color: _phase == _Phase.pass
              ? const Color(0xFF111111)
              : (isImposter
                  ? const Color(0xFF7F1D1D)
                  : const Color(0xFF14532D)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(28),
              child: _phase == _Phase.pass
                  ? _PassView(playerNumber: playerNumber)
                  : _RevealView(
                      playerNumber: playerNumber,
                      isImposter: isImposter,
                      word: widget.game.secretWord,
                      category: widget.game.category.name,
                      isLast: isLast,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PassView extends StatelessWidget {
  final int playerNumber;
  const _PassView({required this.playerNumber});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PASS TO',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.6),
              fontSize: 16,
              letterSpacing: 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'PLAYER $playerNumber',
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w900,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 32),
          const Icon(Icons.touch_app, size: 56),
          const SizedBox(height: 12),
          Text(
            'Tap to reveal your role',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _RevealView extends StatelessWidget {
  final int playerNumber;
  final bool isImposter;
  final String word;
  final String category;
  final bool isLast;

  const _RevealView({
    required this.playerNumber,
    required this.isImposter,
    required this.word,
    required this.category,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'PLAYER $playerNumber',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
              letterSpacing: 4,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 24),
          if (isImposter) ...[
            const Text(
              'YOU ARE THE',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'IMPOSTER',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Category: $category',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Bluff your way through.\nFigure out the word from clues.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 15,
              ),
            ),
          ] else ...[
            Text(
              'CATEGORY · ${category.toUpperCase()}',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 12,
                letterSpacing: 3,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'THE WORD IS',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              word,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Don\'t say it directly.\nGive a subtle clue.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 15,
              ),
            ),
          ],
          const SizedBox(height: 40),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              isLast ? 'Tap when ready to discuss' : 'Tap to pass to next',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

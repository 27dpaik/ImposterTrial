import 'package:flutter/material.dart';
import '../data/word_bank.dart';
import '../models/game.dart';
import 'reveal_screen.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  static const int minPlayers = 3;
  static const int maxPlayers = 12;

  int _playerCount = 5;
  int _imposterCount = 1;
  Category _category = wordBank.firstWhere((c) => c.words.isNotEmpty);

  int get _maxImposters {
    final cap = (_playerCount - 1) ~/ 2;
    return cap < 1 ? 1 : cap;
  }

  void _setPlayerCount(int n) {
    setState(() {
      _playerCount = n.clamp(minPlayers, maxPlayers);
      if (_imposterCount > _maxImposters) _imposterCount = _maxImposters;
    });
  }

  void _setImposterCount(int n) {
    setState(() {
      _imposterCount = n.clamp(1, _maxImposters);
    });
  }

  void _start() {
    if (_category.words.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Category "${_category.name}" has no words yet.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    final game = Game.create(
      playerCount: _playerCount,
      imposterCount: _imposterCount,
      category: _category,
    );
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => RevealScreen(game: game)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'IMPOSTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 6,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Pass-and-play party game',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.6),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 36),
              _Stepper(
                label: 'Players',
                value: _playerCount,
                min: minPlayers,
                max: maxPlayers,
                onChanged: _setPlayerCount,
              ),
              const SizedBox(height: 16),
              _Stepper(
                label: 'Imposters',
                value: _imposterCount,
                min: 1,
                max: _maxImposters,
                onChanged: _setImposterCount,
              ),
              const SizedBox(height: 24),
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final c in wordBank)
                    ChoiceChip(
                      label: Text(
                        c.words.isEmpty ? '${c.name} (empty)' : c.name,
                      ),
                      selected: _category.name == c.name,
                      onSelected: (_) => setState(() => _category = c),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: _start,
                child: const Text('START GAME'),
              ),
              const SizedBox(height: 12),
              Text(
                'Pass the phone to Player 1 to begin.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Stepper extends StatelessWidget {
  final String label;
  final int value;
  final int min;
  final int max;
  final ValueChanged<int> onChanged;

  const _Stepper({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final canDec = value > min;
    final canInc = value < max;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$value',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: canDec ? () => onChanged(value - 1) : null,
            icon: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          IconButton.filledTonal(
            onPressed: canInc ? () => onChanged(value + 1) : null,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

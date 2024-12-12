import 'package:flutter/material.dart';
import '../models/joke.dart';

class JokeCard extends StatefulWidget {
  final Joke joke;

  const JokeCard({super.key, required this.joke});

  @override
  _JokeCardState createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  bool _showPunchline = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          setState(() {
            _showPunchline = !_showPunchline;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.joke.setup,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (_showPunchline) ...[
                const SizedBox(height: 8),
                Text(
                  widget.joke.punchline,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
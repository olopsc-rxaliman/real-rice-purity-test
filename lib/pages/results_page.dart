import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';

class ResultsPage extends StatelessWidget {
  final int score;

  const ResultsPage({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E8C1),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/resources/rice.png',
              repeat: ImageRepeat.repeat,
              scale: 2,
              opacity: const AlwaysStoppedAnimation(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    const Text(
                      "Your Rice Score is",
                      style: TextStyle(
                        fontFamily: 'Baskerville',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '$score',
                      style: const TextStyle(
                        fontFamily: 'Baskerville',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Test Again",
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

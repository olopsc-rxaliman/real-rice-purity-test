import 'package:flutter/material.dart';
import 'package:myapp/pages/checklist_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7E8C1),
      body: Stack(children: [
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
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Baskerville',
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text: 'The Real\n',
                              style: TextStyle(color: Colors.red, fontSize: 24)),
                          TextSpan(
                              text: 'Rice Purity Test',
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: '\nMade by: Rovic Aliman (2025)',
                            style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal, height: 1.5),
                          )
                        ]),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const ChecklistPage())
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Start Test",
                      style: TextStyle(fontFamily: 'Roboto'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

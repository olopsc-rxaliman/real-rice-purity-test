import 'package:flutter/material.dart';
import 'package:myapp/components/checklist.dart';
import 'package:myapp/pages/results_page.dart';

class ChecklistPage extends StatefulWidget {
  const ChecklistPage({super.key});

  @override
  State<ChecklistPage> createState() => _ChecklistPageState();
}

class _ChecklistPageState extends State<ChecklistPage> {
  late List<Map> checklist;

  @override
  void initState() {
    _resetChecklist();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _resetChecklist();
    super.didChangeDependencies();
  }

  void _resetChecklist() {
    checklist = chklst.map((item) => Map<String, dynamic>.from(item)).toList();
  }

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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: 'Baskerville',
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                  text: 'The Real\n',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 16)),
                              TextSpan(
                                  text: 'Rice Purity Test',
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                text: '\nAnswer with honesty. Thank you',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              )
                            ]),
                      ),
                    ),
                    ListView.builder(
                      itemBuilder: (context, index) => CheckboxListTile(
                        key: ValueKey(checklist[index]['text']),
                        checkColor: Colors.white,
                        activeColor: Colors.black,
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checklist[index]['checked'],
                        onChanged: (value) {
                          setState(() {
                            checklist[index]['checked'] =
                                !checklist[index]['checked'];
                          });
                        },
                        title: Text(
                          checklist[index]['question'],
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 16,
                          ),
                        ),
                      ),
                      itemCount: checklist.length,
                      shrinkWrap: true,
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        int checks = 0;

                        for (var item in checklist) {
                          if (item['checked'] == true) checks++;
                        }

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ResultsPage(score: checks)));
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        "Calculate Rice Score",
                        style: TextStyle(fontFamily: 'Roboto'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

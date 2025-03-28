import 'package:flutter/material.dart';

class TriggerPhrasesPage extends StatefulWidget {
  const TriggerPhrasesPage({Key? key}) : super(key: key);

  @override
  _TriggerPhrasesPageState createState() => _TriggerPhrasesPageState();
}

class _TriggerPhrasesPageState extends State<TriggerPhrasesPage> {
  final List<Map<String, dynamic>> _triggerPhrases = [
    {'phrase': 'My battery is low', 'status': 'Voice trained', 'trained': true},
    {
      'phrase': 'I forgot to feed the dog',
      'status': 'Voice trained',
      'trained': true,
    },
    {
      'phrase': 'Where is my red notebook',
      'status': 'Not trained',
      'trained': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1322),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Trigger Phrases',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'These phrases will activate SOS alerts when detected during calls.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),

            // Add New Trigger Phrase Button
            _buildAddPhraseButton(),

            const SizedBox(height: 16),

            // Existing Trigger Phrases
            ...(_triggerPhrases
                .map((phrase) => _buildTriggerPhraseItem(phrase))
                .toList()),

            const Spacer(),

            // Need Some Ideas Section
            _buildIdeasSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildAddPhraseButton() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            // Add new phrase functionality
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  'Add new trigger phrase',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTriggerPhraseItem(Map<String, dynamic> phrase) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A2035),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phrase['phrase'],
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      phrase['status'],
                      style: TextStyle(
                        color: phrase['trained'] ? Colors.green : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  if (phrase['trained'])
                    IconButton(
                      icon: const Icon(Icons.volume_up, color: Colors.white70),
                      onPressed: () {
                        // Play voice functionality
                      },
                    ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Delete phrase functionality
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdeasSection() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Need some ideas?',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildBulletPoint('Uncommon in regular conversation'),
          _buildBulletPoint('Easy for you to remember'),
          _buildBulletPoint('Natural-sounding in a stressful situation'),
          _buildBulletPoint('Not likely to be accidentally said'),
        ],
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6.0, right: 8.0),
            child: Icon(Icons.circle, size: 8, color: Colors.white70),
          ),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white70)),
          ),
        ],
      ),
    );
  }
}

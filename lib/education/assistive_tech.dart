import 'package:flutter/material.dart';

class AssistiveTechPage extends StatefulWidget {
  @override
  _AssistiveTechPageState createState() => _AssistiveTechPageState();
}

class _AssistiveTechPageState extends State<AssistiveTechPage> {
  bool _textToSpeechEnabled = false;
  bool _speechToTextEnabled = false;
  bool _distractionFreeMode = false;
  double _fontSize = 16.0;
  double _contrast = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistive Technologies'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize Your Learning Experience',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            
            // Text to Speech
            _buildSwitchTile(
              'Text-to-Speech',
              'Converts text to spoken words',
              Icons.record_voice_over,
              _textToSpeechEnabled,
              (value) {
                setState(() {
                  _textToSpeechEnabled = value;
                });
              },
            ),
            
            // Speech to Text
            _buildSwitchTile(
              'Speech-to-Text',
              'Convert your voice to written text',
              Icons.mic,
              _speechToTextEnabled,
              (value) {
                setState(() {
                  _speechToTextEnabled = value;
                });
              },
            ),
            
            // Distraction Free Mode
            _buildSwitchTile(
              'Distraction-Free Mode',
              'Remove unnecessary UI elements',
              Icons.visibility,
              _distractionFreeMode,
              (value) {
                setState(() {
                  _distractionFreeMode = value;
                });
              },
            ),
            
            // Font Size
            _buildSliderTile(
              'Font Size',
              'Adjust text size for better readability',
              Icons.format_size,
              _fontSize,
              12.0,
              24.0,
              (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            
            // Contrast
            _buildSliderTile(
              'Contrast',
              'Adjust screen contrast',
              Icons.contrast,
              _contrast,
              0.0,
              1.0,
              (value) {
                setState(() {
                  _contrast = value;
                });
              },
            ),
            
            SizedBox(height: 24),
            
            // Preview Section
            Text(
              'Preview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sample Text',
                    style: TextStyle(
                      fontSize: _fontSize + 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is how your content will appear with the current settings. Adjust the options above to customize your learning experience.',
                    style: TextStyle(
                      fontSize: _fontSize,
                      color: Color.lerp(
                        Colors.grey.shade600,
                        Colors.black,
                        _contrast,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save settings
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Settings saved')),
                  );
                },
                child: Text('Save Settings'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String description,
    IconData icon,
    bool value,
    Function(bool) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliderTile(
    String title,
    String description,
    IconData icon,
    double value,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.teal),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text(description, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text(min.toString()),
                Expanded(
                  child: Slider(
                    value: value,
                    min: min,
                    max: max,
                    divisions: (max - min).toInt() * 4,
                    onChanged: onChanged,
                    activeColor: Colors.teal,
                  ),
                ),
                Text(max.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
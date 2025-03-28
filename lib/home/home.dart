import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSilentSOSActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1322),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Silent SOS',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Switch(
                        value: _isSilentSOSActive,
                        onChanged: (bool value) {
                          setState(() {
                            _isSilentSOSActive = value;
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      const Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Protection Status Card
              _buildProtectionStatusCard(),

              const SizedBox(height: 16),

              // Middle Buttons
              _buildMiddleButtons(),

              const SizedBox(height: 16),

              // Alerts and App Settings Buttons
              _buildAlertsAndAppSettingsButtons(),

              const SizedBox(height: 16),

              // Quick Actions Title
              const Text(
                'Quick Actions',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              // Quick Actions
              _buildQuickActionsSection(),

              const SizedBox(height: 16),

              // Protection Active Card
              _buildProtectionActiveCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProtectionStatusCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Protection Status',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Active',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Last synced',
                style: TextStyle(color: Colors.white70),
              ),
              Text('Today, 2:45 PM', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Phrases configured',
                style: TextStyle(color: Colors.white70),
              ),
              Text('3', style: TextStyle(color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'SOS detection is active during calls',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleButtons() {
    return Row(
      children: [
        Expanded(child: _buildIconButton(Icons.mic, 'Trigger Phrases')),
        const SizedBox(width: 16),
        Expanded(child: _buildIconButton(Icons.person, 'Emergency Contacts')),
      ],
    );
  }

  Widget _buildAlertsAndAppSettingsButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildIconButton(Icons.notifications, 'Alert Settings'),
        ),
        const SizedBox(width: 16),
        Expanded(child: _buildIconButton(Icons.settings, 'App Settings')),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String label) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white70),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsSection() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF1A2035),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'Ongoing setup',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: const Center(
                  child: Text(
                    'Test SOS Alert',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProtectionActiveCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2035),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        children: [
          Icon(Icons.circle, color: Colors.red, size: 12),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Protection Active: Your emergency phrases are being monitored during calls. To test, say one of your phrases during a call.',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

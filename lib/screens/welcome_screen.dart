import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late String _deviceId;

  @override
  void initState() {
    super.initState();
    _fetchAndSaveDeviceId();
  }

  Future<void> _fetchAndSaveDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    String deviceId;

    if (Theme.of(context).platform == TargetPlatform.android) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id!;
    } else {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor!;
    }

    setState(() {
      _deviceId = deviceId;
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('device_id', deviceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Night')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Share Code Screen
              },
              child: const Text('Start Session'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Enter Code Screen
              },
              child: const Text('Enter Code'),
            ),
          ],
        ),
      ),
    );
  }
}

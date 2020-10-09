import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'tasks_screen.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  Future<bool> _isBiometricsAvailable() async {
    bool isAvailable = false;
    try {
      isAvailable = await _localAuthentication.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return isAvailable;

    isAvailable
        ? print('Biometric is available')
        : print('Biometric is unavailable');

    return isAvailable;
  }

  Future<void> _authenticate() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuthentication.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;

    isAuthenticated
        ? print('User authenticated')
        : print('User not authenticated');

    if (isAuthenticated) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TasksScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          if (await _isBiometricsAvailable()) {
            await _authenticate();
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.fingerprint,
              size: 80.0,
            ),
            Text(
              'Touch to Unlock',
              style: TextStyle(fontSize: 20.0),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

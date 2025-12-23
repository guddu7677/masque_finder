import 'package:flutter/material.dart';

class AuthNavigationProvider extends ChangeNotifier {
  int _currentStep = 0;
  
  int get currentStep => _currentStep;

  void goToOtp(BuildContext context) {
    _currentStep = 1;
    Navigator.pushNamed(context, "/OtpScreen");
    notifyListeners();
  }

  void goToProfile(BuildContext context) {
    _currentStep = 2;
    Navigator.pushNamed(context, "/RegisterProfileScreen");
    notifyListeners();
  }

  void goToLocation(BuildContext context) {
    _currentStep = 3;
    Navigator.pushNamed(context, "/LocationPermision");
    notifyListeners();
  }

  void goToMain(BuildContext context) {
    _currentStep = 4;
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/MainScreen",
      (route) => false, 
    );
    notifyListeners();
  }

  void backToLogin(BuildContext context) {
    _currentStep = 0;
    Navigator.pushNamedAndRemoveUntil(
      context,
      "/LoginScreen",
      (route) => false,
    );
    notifyListeners();
  }

  void reset() {
    _currentStep = 0;
    notifyListeners();
  }
}
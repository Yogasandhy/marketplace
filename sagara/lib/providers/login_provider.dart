import 'package:flutter/foundation.dart';

class LoginProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  bool get canSubmit =>
      _email.isNotEmpty && _password.isNotEmpty && !_isLoading;

  void updateEmail(String value) {
    _email = value.trim();
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!canSubmit) {
      return;
    }
    _isLoading = true;
    notifyListeners();
    await Future<void>.delayed(const Duration(seconds: 1));
    _isLoading = false;
    notifyListeners();
  }
}

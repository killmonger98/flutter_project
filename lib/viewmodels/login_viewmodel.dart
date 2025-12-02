import 'package:flutter/foundation.dart';

class LoginViewModel extends ChangeNotifier {
  String? _name;
  String? _empId;

  String? get name => _name;
  String? get empId => _empId;

  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmpId(String value) {
    _empId = value;
    notifyListeners();
  }

  bool validate() {
    return true; // change later
  }
}

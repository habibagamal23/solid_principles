import 'package:flutter/material.dart';
import '../model/repo.dart';
import '../model/usermodelmvv.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepositoryMvvm userRepository;

  UserModelMvvm? _user;
  bool _isLoading = false;
  String _errorMessage = '';

  UserModelMvvm? get user => _user;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  UserViewModel({required this.userRepository});

  Future<void> fetchUserData() async {
    _isLoading = true;
    notifyListeners(); // Notify listeners to update UI
    try {
      final result = await userRepository.fetchUserData();
      if (result.isSuccess) {
        _user = result.data;
        _errorMessage = ''; // Reset error message
      } else {
        _errorMessage = result.error ?? 'Unknown Error';
      }
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners(); // Notify listeners after data is fetched
    }
  }
}

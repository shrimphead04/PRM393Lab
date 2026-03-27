class MockAuthService {
  static const String _validEmail = 'admin@gmail.com';
  static const String _validPassword = 'admin123';

  Future<String?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (email.trim() == _validEmail && password == _validPassword) {
      return 'mock_token_xyz_${DateTime.now().millisecondsSinceEpoch}';
    }

    return null;
  }
}
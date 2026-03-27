import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

class AuthService {
  static const String _baseUrl = 'https://dummyjson.com';

  Future<UserModel> login(String username, String password) async {
    final uri = Uri.parse('$_baseUrl/auth/login');
    try {
      final response = await http
          .post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
          'expiresInMins': 30,
        }),
      )
          .timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw AuthException(
          'Kết nối quá thời gian. Kiểm tra internet và thử lại.',
        ),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(data);
      } else if (response.statusCode == 400) {
        throw AuthException('Tên đăng nhập hoặc mật khẩu không đúng.');
      } else {
        throw AuthException(
          'Lỗi server (${response.statusCode}). Thử lại sau.',
        );
      }
    } on AuthException {
      rethrow;
    } catch (e) {
      throw AuthException(
        'Không thể kết nối. Kiểm tra kết nối internet của bạn.',
      );
    }
  }
}
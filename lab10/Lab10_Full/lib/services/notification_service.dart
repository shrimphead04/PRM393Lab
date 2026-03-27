import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await _plugin.initialize(settings);
  }

  static Future<void> showLoginSuccessNotification(String name) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'auth_channel',
      'Authentication Notifications',
      channelDescription: 'Notifications for login/logout actions',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails details = NotificationDetails(
      android: androidDetails,
    );

    await _plugin.show(
      0,
      '✅ Đăng nhập thành công',
      'Chào mừng Nguyễn Hoàng Việt ($name) đã quay trở lại!',
      details,
    );
  }
}

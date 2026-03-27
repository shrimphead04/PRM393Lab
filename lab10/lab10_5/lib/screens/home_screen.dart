import 'package:flutter/material.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _permissionGranted = false;
  int _notificationCount = 0;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    final granted = await NotificationService.requestPermission();
    setState(() => _permissionGranted = granted);
  }

  Future<void> _showSimpleNotification() async {
    if (!_permissionGranted) {
      _showPermissionWarning();
      return;
    }
    _notificationCount++;
    await NotificationService.showSimpleNotification(
      id: _notificationCount,
      title: '🔔 Thông báo đơn giản',
      body: 'Đây là thông báo số $_notificationCount từ Nguyễn Hoàng Việt!',
    );
    _showSnackBar('Đã gửi thông báo đơn giản!');
  }

  Future<void> _showLoginSuccessNotification() async {
    if (!_permissionGranted) {
      _showPermissionWarning();
      return;
    }
    _notificationCount++;
    await NotificationService.showSimpleNotification(
      id: _notificationCount,
      title: '✅ Đăng nhập thành công',
      body: 'Chào mừng Nguyễn Hoàng Việt đã quay trở lại!',
    );
    _showSnackBar('Đã gửi thông báo đăng nhập thành công!');
  }

  Future<void> _showBigTextNotification() async {
    if (!_permissionGranted) {
      _showPermissionWarning();
      return;
    }
    _notificationCount++;
    await NotificationService.showBigTextNotification(
      id: _notificationCount,
      title: '📋 Thông báo văn bản lớn',
      body: 'Nhấn để mở rộng và đọc thêm...',
      bigText:
      'Đây là thông báo văn bản lớn từ bài Lab 10.5 của Nguyễn Hoàng Việt!\n\nNó có thể chứa nhiều nội dung hơn và mở rộng khi người dùng nhấn vào.\n\nTính năng này giúp đạt yêu cầu LO7 về tích hợp Notification.',
    );
    _showSnackBar('Đã gửi thông báo văn bản lớn!');
  }

  Future<void> _cancelAll() async {
    await NotificationService.cancelAll();
    _showSnackBar('Đã hủy tất cả thông báo!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _showPermissionWarning() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('⚠️ Quyền thông báo chưa được cấp!'),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications - Nguyễn Hoàng Việt'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: _permissionGranted ? Colors.green[50] : Colors.red[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: _permissionGranted ? Colors.green : Colors.red,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Icon(
                      _permissionGranted
                          ? Icons.notifications_active
                          : Icons.notifications_off,
                      color: _permissionGranted ? Colors.green : Colors.red,
                      size: 32,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Quyền thông báo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _permissionGranted
                                ? Colors.green[800]
                                : Colors.red[800],
                          ),
                        ),
                        Text(
                          _permissionGranted ? '✅ Đã cấp quyền' : '❌ Chưa cấp quyền',
                          style: TextStyle(
                            color: _permissionGranted
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    if (!_permissionGranted) ...[
                      const Spacer(),
                      TextButton(
                        onPressed: _requestPermission,
                        child: const Text('Cấp quyền'),
                      ),
                    ]
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Gửi thông báo thử nghiệm',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildButton(
              icon: Icons.notifications,
              label: 'Thông báo đơn giản',
              color: Colors.teal,
              onPressed: _showSimpleNotification,
            ),
            const SizedBox(height: 12),

            _buildButton(
              icon: Icons.login,
              label: 'Thông báo Đăng nhập (LO7)',
              color: Colors.blue,
              onPressed: _showLoginSuccessNotification,
            ),
            const SizedBox(height: 12),

            _buildButton(
              icon: Icons.article,
              label: 'Thông báo văn bản lớn',
              color: Colors.purple,
              onPressed: _showBigTextNotification,
            ),

            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 12),

            _buildButton(
              icon: Icons.cancel,
              label: 'Hủy tất cả thông báo',
              color: Colors.red,
              onPressed: _cancelAll,
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.teal[200]!),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '💡 Thông tin sinh viên',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '• Họ tên: Nguyễn Hoàng Việt\n'
                        '• Chức năng: flutter_local_notifications\n'
                        '• Yêu cầu: Đã tích hợp thông báo khi đăng nhập thành công (LO7).',
                    style: TextStyle(fontSize: 13, height: 1.5),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

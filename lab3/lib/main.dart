// Lab 3 – Advanced Dart Practice Exercises
// Sinh viên: HiepVTHE181347
// Mục tiêu: Thực hành các tính năng nâng cao của Dart

import 'dart:async';
import 'dart:convert';

// ========================================================================
// EXERCISE 1 – Product Model & Repository (Futures & Streams)
// ========================================================================

/// Model đại diện cho sản phẩm
class Product {
  final int id;
  final String name;
  final double price;

  Product({required this.id, required this.name, required this.price});

  @override
  String toString() =>
      'Product(id: $id, name: $name, price: \$${price.toStringAsFixed(2)})';
}

/// Repository quản lý dữ liệu Product với Future và Stream
class ProductRepository {
  // Danh sách sản phẩm trong bộ nhớ
  final List<Product> _products = [];

  // StreamController để broadcast sự kiện khi có product mới được thêm vào
  final StreamController<Product> _addedController =
      StreamController<Product>.broadcast();

  /// Lấy tất cả sản phẩm (async - trả về Future)
  Future<List<Product>> getAll() async {
    // Giả lập độ trễ khi fetch data từ API
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_products);
  }

  /// Stream theo dõi sản phẩm mới được thêm vào
  Stream<Product> liveAdded() {
    return _addedController.stream;
  }

  /// Thêm sản phẩm mới và emit event qua stream
  void addProduct(Product product) {
    _products.add(product);
    _addedController.add(product); // Phát sự kiện qua stream
  }

  /// Đóng stream controller khi không dùng nữa
  void dispose() {
    _addedController.close();
  }
}

// ========================================================================
// EXERCISE 2 – User Repository with JSON
// ========================================================================

/// Model User với khả năng parse từ JSON
class User {
  final String name;
  final String email;

  User({required this.name, required this.email});

  /// Factory constructor để tạo User từ JSON Map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['name'] as String, email: json['email'] as String);
  }

  @override
  String toString() => 'User(name: $name, email: $email)';
}

/// Repository giả lập việc fetch và parse JSON từ API
class UserRepository {
  /// Giả lập API trả về JSON string
  Future<String> _fetchJsonFromApi() async {
    // Giả lập network delay
    await Future.delayed(Duration(milliseconds: 300));

    // JSON data giả lập
    return '''
    [
      {"name": "Nguyen Van A", "email": "nguyenvana@example.com"},
      {"name": "Tran Thi B", "email": "tranthib@example.com"},
      {"name": "Le Van C", "email": "levanc@example.com"}
    ]
    ''';
  }

  /// Lấy danh sách User từ JSON
  Future<List<User>> fetchUsers() async {
    // Fetch JSON string
    final jsonString = await _fetchJsonFromApi();

    // Decode JSON string thành List<dynamic>
    final List<dynamic> jsonList = jsonDecode(jsonString);

    // Parse từng item thành User object
    final users = jsonList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();

    return users;
  }
}

// ========================================================================
// EXERCISE 3 – Async + Microtask Debugging
// ========================================================================

/// Hàm demo sự khác biệt giữa microtask queue và event queue
void demonstrateEventLoop() {
  print('\n--- Bắt đầu Event Loop Demo ---');

  // 1. Synchronous code - chạy ngay lập tức
  print('1. Sync: Dòng code đồng bộ');

  // 2. Future (Event queue) - sẽ chạy sau khi microtask queue xong
  Future(() {
    print('3. Event Queue: Future(() {...})');
  });

  // 3. Microtask - có độ ưu tiên cao hơn event queue
  scheduleMicrotask(() {
    print('2. Microtask: scheduleMicrotask()');
  });

  // 4. Future với delay (Event queue)
  Future.delayed(Duration(milliseconds: 0), () {
    print('4. Event Queue: Future.delayed()');
  });

  // 5. Một microtask khác
  scheduleMicrotask(() {
    print('2. Microtask: scheduleMicrotask() thứ hai');
  });

  print('1. Sync: Kết thúc hàm main');

  // Giải thích:
  // - Synchronous code chạy trước tiên (1)
  // - Microtask queue được xử lý tiếp theo (2)
  // - Event queue (Futures) được xử lý cuối cùng (3, 4)
  print('\n--- Giải thích: Microtasks luôn chạy trước Events ---\n');
}

// ========================================================================
// EXERCISE 4 – Stream Transformation
// ========================================================================

/// Demo các phép biến đổi stream với map() và where()
Future<void> demonstrateStreamTransformation() async {
  print('\n--- Stream Transformation Demo ---');

  // Tạo stream phát ra các số từ 1 đến 5
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // Biến đổi: Bình phương mỗi số (map), lọc số chẵn (where)
  Stream<int> transformedStream = numberStream
      .map((number) {
        final squared = number * number;
        print('  map: $number -> $squared (bình phương)');
        return squared;
      })
      .where((squared) {
        final isEven = squared % 2 == 0;
        print(
          '  where: $squared -> ${isEven ? "GIỮ LẠI (chẵn)" : "LOẠI BỎ (lẻ)"}',
        );
        return isEven;
      });

  // Lắng nghe kết quả cuối cùng
  print('\nKết quả cuối cùng (chỉ số chính phương chẵn):');
  await for (var value in transformedStream) {
    print('  => $value');
  }

  print('--- Kết thúc Stream Transformation ---\n');
}

// ========================================================================
// EXERCISE 5 – Factory Constructors & Cache (Singleton Pattern)
// ========================================================================

/// Class Settings implement singleton pattern với factory constructor
class Settings {
  // Private constructor - không thể gọi từ bên ngoài
  Settings._internal();

  // Cached instance - lưu trữ instance duy nhất
  static final Settings _instance = Settings._internal();

  /// Factory constructor - luôn trả về cùng 1 instance
  factory Settings() {
    return _instance;
  }

  // Thuộc tính của Settings
  String theme = 'light';
  int fontSize = 14;

  @override
  String toString() => 'Settings(theme: $theme, fontSize: $fontSize)';
}

/// Demo factory constructor và singleton pattern
void demonstrateSingleton() {
  print('\n--- Factory Constructor & Singleton Demo ---');

  // Tạo "nhiều" instance
  final settings1 = Settings();
  final settings2 = Settings();

  print('settings1: $settings1');
  print('settings2: $settings2');

  // Kiểm tra xem có phải cùng 1 object không
  print('identical(settings1, settings2): ${identical(settings1, settings2)}');

  // Thay đổi settings1
  settings1.theme = 'dark';
  settings1.fontSize = 16;

  // settings2 cũng thay đổi theo vì cùng trỏ đến 1 instance
  print('\nSau khi thay đổi settings1:');
  print('settings1: $settings1');
  print('settings2: $settings2');

  print('--- Kết luận: Factory constructor đảm bảo singleton ---\n');
}

// ========================================================================
// MAIN FUNCTION - Chạy tất cả các exercise
// ========================================================================

void main() async {
  print('╔═══════════════════════════════════════════════════════════════╗');
  print('║   LAB 3 – ADVANCED DART PRACTICE EXERCISES                    ║');
  print('║   Sinh viên: HiepVTHE181347                                   ║');
  print('╚═══════════════════════════════════════════════════════════════╝\n');

  // =========== EXERCISE 1: Product Model & Repository ===========
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('EXERCISE 1: Product Model & Repository (Futures & Streams)');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  final productRepo = ProductRepository();

  // Subscribe to live added stream
  print('Đang lắng nghe stream sản phẩm mới...\n');
  productRepo.liveAdded().listen((product) {
    print('🔔 Stream Event: Sản phẩm mới được thêm -> $product');
  });

  // Thêm sản phẩm
  print('Thêm sản phẩm vào repository...');
  productRepo.addProduct(Product(id: 1, name: 'Laptop', price: 999.99));
  productRepo.addProduct(Product(id: 2, name: 'Mouse', price: 25.50));
  productRepo.addProduct(Product(id: 3, name: 'Keyboard', price: 75.00));

  // Delay ngắn để stream events được xử lý
  await Future.delayed(Duration(milliseconds: 100));

  // Fetch tất cả sản phẩm qua Future
  print('\nGọi getAll() để lấy danh sách sản phẩm...');
  final products = await productRepo.getAll();
  print('📦 Tất cả sản phẩm:');
  for (var product in products) {
    print('  - $product');
  }

  // =========== EXERCISE 2: User Repository with JSON ===========
  print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('EXERCISE 2: User Repository with JSON');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n');

  final userRepo = UserRepository();

  print('Đang fetch users từ API giả lập...');
  final users = await userRepo.fetchUsers();

  print('👥 Danh sách Users:');
  for (var user in users) {
    print('  - $user');
  }

  // =========== EXERCISE 3: Async + Microtask Debugging ===========
  print('\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('EXERCISE 3: Async + Microtask Debugging');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  demonstrateEventLoop();

  // Delay để event loop hoàn thành
  await Future.delayed(Duration(milliseconds: 100));

  // =========== EXERCISE 4: Stream Transformation ===========
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('EXERCISE 4: Stream Transformation');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  await demonstrateStreamTransformation();

  // =========== EXERCISE 5: Factory Constructors & Cache ===========
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');
  print('EXERCISE 5: Factory Constructors & Cache (Singleton)');
  print('━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━');

  demonstrateSingleton();

  // =========== KẾT THÚC ===========
  print('╔═══════════════════════════════════════════════════════════════╗');
  print('║   HOÀN THÀNH TẤT CẢ 5 BÀI TẬP                                 ║');
  print('╚═══════════════════════════════════════════════════════════════╝\n');

  // Cleanup
  productRepo.dispose();
}

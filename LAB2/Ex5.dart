import 'dart:async';
import 'dart:math';

// Hàm async sử dụng Future và await
Future<String> fetchData() async {
  print('Đang bắt đầu lấy dữ liệu...');

  // Mô phỏng thời gian chờ bằng Future.delayed
  await Future.delayed(Duration(seconds: 2));

  return 'Dữ liệu đã được tải thành công!';
}

// Hàm mô phỏng load dữ liệu có thể thất bại
Future<String?> fetchUserData() async {
  await Future.delayed(Duration(milliseconds: 1500));

  // Ngẫu nhiên trả về null hoặc dữ liệu
  Random random = Random();
  if (random.nextBool()) {
    return 'Người dùng: John Doe';
  } else {
    return null; // Giả lập lỗi hoặc không có dữ liệu
  }
}

void main() async {
  print('=== Bài tập 5: Async, Future, Null Safety & Streams ===\n');

  // Sử dụng hàm async với Future và await
  print('1. Sử dụng hàm async với Future và await:');
  String result = await fetchData();
  print(result);

  print('\n2. Thực hành toán tử null safety:');

  // Sử dụng toán tử ? (conditional access)
  String? nullableName = 'Alice';
  String? nullName = null;

  print('Tên không rỗng: ${nullableName?.toUpperCase()}');
  print('Tên rỗng: ${nullName?.toUpperCase()}'); // Sẽ không in gì vì null

  // Sử dụng toán tử ?? (cung cấp giá trị mặc định khi null)
  String name1 = nullableName ?? 'Tên mặc định';
  String name2 = nullName ?? 'Tên mặc định';

  print('Tên 1 (không null): $name1');
  print('Tên 2 (được cung cấp mặc định): $name2');

  // Sử dụng toán tử ! (null assertion - chỉ dùng khi chắc chắn không null)
  if (nullableName != null) {
    print('Tên khi chắc chắn không null: ${nullableName!.length} ký tự');
  }

  // Mô phỏng xử lý dữ liệu có thể null
  String? userData = await fetchUserData();
  if (userData != null) {
    print('Thông tin người dùng: $userData');
  } else {
    print('Không tìm thấy thông tin người dùng');
  }

  // Sử dụng toán tử ?? trong xử lý dữ liệu có thể null
  String safeUserData = userData ?? 'Không có dữ liệu người dùng';
  print('Dữ liệu người dùng an toàn: $safeUserData');

  print('\n3. Tạo và lắng nghe Stream đơn giản:');

  // Tạo một Stream của các số nguyên
  Stream<int> numberStream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // Lắng nghe các giá trị từ Stream
  await for (int number in numberStream) {
    print('Nhận được số: $number');
  }

  print('\n4. Tạo Stream với độ trễ:');

  // Tạo một Stream có độ trễ giữa các giá trị
  Stream<int> delayedNumberStream() async* {
    for (int i = 1; i <= 5; i++) {
      await Future.delayed(Duration(milliseconds: 500));
      yield i;
    }
  }

  // Lắng nghe Stream có độ trễ
  int count = 0;
  await delayedNumberStream().forEach((number) {
    print('Giá trị từ Stream có độ trễ: $number');
    count++;
  });

  print('\nTổng số giá trị nhận được từ Stream có độ trễ: $count');

  print('\n5. Kết hợp Future và Stream:');

  // Tạo Future mô phỏng tải dữ liệu
  Future<List<int>> loadNumbers() async {
    await Future.delayed(Duration(seconds: 1));
    return [10, 20, 30, 40, 50];
  }

  // Chuyển danh sách thành Stream
  Stream<int> createStreamFromFuture() async* {
    List<int> numbers = await loadNumbers();
    for (int number in numbers) {
      yield number;
    }
  }

  print('Dữ liệu từ Future chuyển thành Stream:');
  await for (int number in createStreamFromFuture()) {
    print('Số từ Future-Stream: $number');
  }

  print('\nTất cả các tác vụ đã hoàn thành!');
}

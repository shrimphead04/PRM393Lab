void main() {
  // Viết một khối if/else để kiểm tra điểm số
  int score = 85;

  if (score >= 90) {
    print('Điểm A - Xuất sắc!');
  } else if (score >= 80) {
    print('Điểm B - Khá tốt!');
  } else if (score >= 70) {
    print('Điểm C - Trung bình khá!');
  } else if (score >= 60) {
    print('Điểm D - Trung bình!');
  } else {
    print('Điểm F - Cần cố gắng hơn!');
  }

  // Viết một câu lệnh switch cho ngày trong tuần
  String dayOfWeek = 'Friday';

  switch (dayOfWeek) {
    case 'Monday':
      print('Hôm nay là thứ Hai - Đầu tuần rồi!');
      break;
    case 'Tuesday':
      print('Hôm nay là thứ Ba - Tiếp tục cố gắng!');
      break;
    case 'Wednesday':
      print('Hôm nay là thứ Tư - Giữa tuần rồi!');
      break;
    case 'Thursday':
      print('Hôm nay là thứ Năm - Sắp cuối tuần!');
      break;
    case 'Friday':
      print('Hôm nay là thứ Sáu - Cuối tuần sắp đến!');
      break;
    case 'Saturday':
      print('Hôm nay là thứ Bảy - Ngày nghỉ!');
      break;
    case 'Sunday':
      print('Hôm nay là Chủ Nhật - Thư giãn nào!');
      break;
    default:
      print('Không xác định được ngày trong tuần');
      break;
  }

  // Lặp qua collection sử dụng for, for-in và forEach
  List<String> subjects = ['Toán', 'Văn', 'Anh', 'Lý', 'Hóa'];

  print('\nSử dụng vòng lặp for:');
  for (int i = 0; i < subjects.length; i++) {
    print('${i + 1}. $subjects[i]');
  }

  print('\nSử dụng vòng lặp for-in:');
  for (String subject in subjects) {
    print('Môn học: $subject');
  }

  print('\nSử dụng forEach:');
  subjects.forEach((subject) {
    print('Khóa học: $subject');
  });

  // Tạo function sử dụng cú pháp thông thường và arrow syntax
  // Hàm thông thường
  String greet(String name) {
    return 'Xin chào, $name!';
  }

  // Hàm sử dụng arrow syntax
  int calculateSquare(int number) => number * number;

  // Gọi các hàm
  print('\nGọi hàm thông thường: ${greet('Hiep')}');
  print('Gọi hàm arrow: Bình phương của 5 là ${calculateSquare(5)}');

  // Ví dụ kết hợp: sử dụng if/else trong vòng lặp
  print('\nKiểm tra từng môn học:');
  for (String subject in subjects) {
    if (subject == 'Toán' || subject == 'Lý') {
      print('$subject là môn khoa học tự nhiên');
    } else if (subject == 'Văn' || subject == 'Anh') {
      print('$subject là môn khoa học xã hội');
    } else {
      print('$subject là môn học khác');
    }
  }
}

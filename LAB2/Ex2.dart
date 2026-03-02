void main() {
  // Tạo một List chứa các số nguyên
  List<int> numbers = [1, 2, 3, 4, 5];

  // Sử dụng các toán tử số học và so sánh
  int sum = numbers[0] + numbers[1]; // Phép cộng
  int difference = numbers[2] - numbers[1]; // Phép trừ
  bool isEqual = (numbers[0] == 1); // So sánh bằng
  bool isGreater = (numbers[4] > numbers[0]); // So sánh lớn hơn

  print('List ban đầu: $numbers');
  print('Tổng của hai phần tử đầu tiên: $sum');
  print('Hiệu của phần tử thứ ba và thứ hai: $difference');
  print('Phần tử đầu tiên có bằng 1 không: $isEqual');
  print('Phần tử cuối lớn hơn phần tử đầu không: $isGreater');

  // Thêm và xóa phần tử khỏi List
  numbers.add(6);
  print('List sau khi thêm 6: $numbers');
  numbers.remove(2);
  print('List sau khi xóa số 2: $numbers');

  // Tạo một Set chứa các giá trị duy nhất
  Set<int> uniqueNumbers = {
    1,
    2,
    3,
    4,
    5,
    5,
    4,
    3,
  }; // Các giá trị trùng lặp sẽ bị loại bỏ
  print('Set với các giá trị duy nhất: $uniqueNumbers');

  // Thêm và xóa phần tử khỏi Set
  uniqueNumbers.add(7);
  print('Set sau khi thêm 7: $uniqueNumbers');
  uniqueNumbers.remove(3);
  print('Set sau khi xóa số 3: $uniqueNumbers');

  // Tạo một Map chứa các cặp khóa-giá trị
  Map<String, int> ages = {'John': 25, 'Jane': 30, 'Bob': 35};

  print('Map ban đầu: $ages');

  // Truy cập và thay đổi giá trị trong Map
  print('Tuổi của John: ${ages['John']}');
  ages['Alice'] = 28; // Thêm cặp khóa-giá trị mới
  print('Map sau khi thêm Alice: $ages');
  ages.remove('Bob'); // Xóa cặp khóa-giá trị
  print('Map sau khi xóa Bob: $ages');

  // Sử dụng toán tử logic &&
  bool condition1 = (numbers.length > 3);
  bool condition2 = (uniqueNumbers.contains(5));
  bool bothTrue = condition1 && condition2;
  print('Cả hai điều kiện đều đúng: $bothTrue');

  // Sử dụng toán tử điều kiện (ternary operator)
  String result = (numbers.length > 4) ? 'Danh sách dài' : 'Danh sách ngắn';
  print('Trạng thái danh sách: $result');
}

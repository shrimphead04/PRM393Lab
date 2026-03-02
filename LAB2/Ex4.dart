// Tạo một class Car với một thuộc tính và một phương thức
class Car {
  String brand;
  int year;

  // Constructor mặc định
  Car(this.brand, this.year);

  // Named constructor
  factory Car.luxury(String brand, int year) {
    print('Tạo xe cao cấp: $brand năm $year');
    return Car(brand, year);
  }

  // Một phương thức
  void startEngine() {
    print('Động cơ xe $brand đang nổ máy...');
  }

  // Phương thức khác
  void displayInfo() {
    print('Xe $brand sản xuất năm $year');
  }
}

// Tạo một lớp con ElectricCar kế thừa từ Car
class ElectricCar extends Car {
  int batteryCapacity; // Dung lượng pin tính bằng kWh

  // Constructor cho ElectricCar
  ElectricCar(String brand, int year, this.batteryCapacity)
    : super(brand, year);

  // Ghi đè phương thức startEngine
  @override
  void startEngine() {
    print('Động cơ điện của xe $brand đang khởi động... Không có tiếng ồn!');
  }

  // Phương thức riêng của ElectricCar
  void chargeBattery() {
    print(
      'Đang sạc pin cho xe $brand... Dung lượng pin: ${batteryCapacity}kWh',
    );
  }

  // Ghi đè phương thức displayInfo
  @override
  void displayInfo() {
    print(
      'Xe điện $brand sản xuất năm $year với dung lượng pin ${batteryCapacity}kWh',
    );
  }
}

void main() {
  // Tạo đối tượng Car sử dụng constructor mặc định
  Car car1 = Car('Toyota', 2022);
  car1.displayInfo();
  car1.startEngine();

  print('');

  // Tạo đối tượng Car sử dụng named constructor
  Car car2 = Car.luxury('Mercedes', 2023);
  car2.displayInfo();
  car2.startEngine();

  print('');

  // Tạo đối tượng ElectricCar
  ElectricCar electricCar = ElectricCar('Tesla', 2024, 75);
  electricCar.displayInfo();
  electricCar.startEngine();
  electricCar.chargeBattery();

  print('');

  // Kiểm tra tính kế thừa
  print('Kiểm tra kiểu dữ liệu:');
  print('electricCar là instance của Car: ${electricCar is Car}');
  print(
    'electricCar là instance của ElectricCar: ${electricCar is ElectricCar}',
  );
  print('car1 là instance của ElectricCar: ${car1 is ElectricCar}');
}

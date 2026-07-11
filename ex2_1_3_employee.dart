// คลาสแม่ (Base Class)
// ใช้คำว่า abstract เพื่อบอกว่าเป็นคลาสแม่ที่เป็นโครงสร้างพื้นฐาน ไม่สามารถสร้างเป็นอ็อบเจกต์ตรงๆ ได้
abstract class Employee {
  String name;

  // คอนสตรัคเตอร์
  Employee(this.name);

  // เมธอดโครงร่างที่ยังไม่มีการทำงานข้างใน เพื่อให้คลาสลูกไปเขียนทับ
  double calculateSalary();
}

// คลาสลูกที่ 1: พนักงานประจำ สืบทอดจาก Employee
class FullTimeEmployee extends Employee {
  double monthlySalary; // เงินเดือนประจำ

  // ส่งชื่อ กลับไปให้คลาสแม่ จัดการ
  FullTimeEmployee(String name, this.monthlySalary) : super(name);

  // ใช้ @override เขียนทับเมธอดของคลาสแม่
  @override
  double calculateSalary() {
    return monthlySalary; // พนักงานประจำได้เงินเดือนแบบคงที่
  }
}

// คลาสลูกที่ 2: พนักงานพาร์ทไทม์ สืบทอดจาก Employee
class PartTimeEmployee extends Employee {
  double hourlyRate; // ค่าจ้างต่อชั่วโมง
  int hoursWorked;   // ชั่วโมงที่ทำงาน

  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked) : super(name);

  // ใช้ @override เขียนทับเมธอดของคลาสแม่ในรูปแบบของตัวเอง
  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked; // พาร์ทไทม์ได้เงินตามชั่วโมงทำงาน
  }
}

void main() {
  print('--- สรุปเงินเดือนพนักงาน ---');

  // สร้าง List ที่เก็บคลาสแม่ (Employee) แต่ยัดคลาสลูกที่แตกต่างกันเข้าไปได้
  List<Employee> employees = [
    FullTimeEmployee('สมชาย (Full-Time)', 30000.0),
    PartTimeEmployee('สมหญิง (Part-Time)', 150.0, 45), // ชั่วโมงละ 150 ทำไป 45 ชม.
    FullTimeEmployee('สมศักดิ์ (Full-Time)', 45000.0),
  ];

  // วนลูปเพื่อแสดงผล
  for (var emp in employees) {
    // คอมพิวเตอร์จะฉลาดพอที่จะรู้ว่า emp ตัวนี้ต้องไปเรียก calculateSalary() ของคลาสลูกตัวไหน
    print('พนักงาน: ${emp.name} | เงินเดือน: ${emp.calculateSalary()} บาท');
  }
}
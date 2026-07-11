// สร้างคลาสนามธรรม เพื่อใช้เป็นแม่แบบ/อินเทอร์เฟซ
abstract class PaymentMethod {
  // เมธอดนามธรรม บังคับให้คลาสอื่นต้องเอาไปเขียนเอง
  void pay(double amount);
}

// คลาสบัตรเครดิต ใช้ implements เพื่อใช้ PaymentMethod เป็น Interface
class CreditCard implements PaymentMethod {
  @override
  void pay(double amount) {
    print('ตัดบัตรเครดิต: ชำระเงินจำนวน $amount บาท สำเร็จแล้ว');
  }
}

// คลาสพร้อมเพย์
class PromptPay implements PaymentMethod {
  @override
  void pay(double amount) {
    print('สแกนพร้อมเพย์: ชำระเงินจำนวน $amount บาท สำเร็จแล้ว');
  }
}

// คลาสเก็บเงินปลายทาง (COD)
class CashOnDelivery implements PaymentMethod {
  @override
  void pay(double amount) {
    print('เก็บเงินปลายทาง: เตรียมเรียกเก็บเงิน $amount บาท เมื่อผู้รับเปิดกล่อง');
  }
}

void main() {
  print('--- ระบบชำระเงิน E-Commerce ---');

  // ทดลองสร้างลิสต์รายการช่องทางการชำระเงิน
  List<PaymentMethod> myPayments = [
    CreditCard(),
    PromptPay(),
    CashOnDelivery(),
  ];

  // สมมติว่าลูกค้าซื้อของราคา 1,250 บาท
  double cartTotal = 1250.0;

  // ลองจำลองการเรียกใช้งานทุกวิธีชำระเงิน
  for (var method in myPayments) {
    method.pay(cartTotal);
  }
}
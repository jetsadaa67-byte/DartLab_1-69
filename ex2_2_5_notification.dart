import 'dart:async'; // ต้อง import ไลบรารีนี้เพื่อใช้งาน StreamController

void main() {
  print('--- เริ่มต้นระบบแจ้งเตือน ---');

  // สร้างสถานีส่งสัญญาณ StreamController สำหรับส่งข้อมูลแบบ String
  StreamController<String> notificationController = StreamController<String>();

  // ดักฟังข้อมูล Listen
  // เปรียบเสมือนผู้ใช้เปิดแอปฯ รอรับการแจ้งเตือน
  notificationController.stream.listen(
    (String message) {
      // โค้ดส่วนนี้จะทำงานทุกครั้งที่มีคนใช้คำสั่ง .add() ส่งข้อมูลเข้ามา
      print('แจ้งเตือนใหม่: $message');
    },
    onDone: () {
      // โค้ดส่วนนี้จะทำงานเมื่อมีการสั่ง .close() ปิดการเชื่อมต่อ
      print('ระบบแจ้งเตือนถูกปิดการเชื่อมต่อแล้ว (Stream closed)');
    },
  );

  // จำลองการส่งข้อมูลแจ้งเตือน Add
  // เปรียบเสมือนเซิร์ฟเวอร์ยิง Push Notification มาให้ผู้ใช้
  print('กำลังจำลองการส่งข้อความ...');
  notificationController.add('มีข้อความใหม่จาก สมหญิง');
  notificationController.add('อัปเดตแอปพลิเคชันเวอร์ชัน 2.0 พร้อมใช้งานแล้ว');
  notificationController.add('แบตเตอรี่ของคุณเหลือ 15%');

  // ปิดสตรีม Close เพื่อคืนหน่วยความจำให้ระบบ
  notificationController.close();
}
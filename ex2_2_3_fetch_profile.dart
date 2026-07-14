// ฟังก์ชันจำลองการดึงข้อมูลจากเซิร์ฟเวอร์
Future<Map<String, dynamic>> fetchProfile(int userId) async {
  // จำลองการหน่วงเวลาโหลดข้อมูล 2 วินาที
  await Future.delayed(Duration(seconds: 2));

  // ตรวจสอบเงื่อนไข ถ้า userId ผิดปกติ ให้โยน Exception แจ้งเตือนข้อผิดพลาด
  if (userId <= 0) {
    throw Exception('ไม่พบข้อมูล: userId ต้องมีค่ามากกว่า 0 (คุณส่งค่า $userId)');
  }

  // ถ้าถูกต้อง ให้คืนค่า Return ข้อมูลโปรไฟล์จำลองในรูปแบบ Map
  return {
    'id': userId,
    'name': 'สมชาย ใจดี',
    'role': 'Developer'
  };
}

void main() async {
  print('--- ทดสอบกรณีที่ 1: ส่ง userId ที่ถูกต้อง (userId = 5) ---');
  // บล็อก try ลองรันโค้ดสุ่มเสี่ยงที่อาจจะเกิด Error ได้
  try {
    print('กำลังโหลดข้อมูล...');
    var profile = await fetchProfile(5); // รอข้อมูล 2 วินาที
    print('โหลดข้อมูลสำเร็จ: $profile');
  } 
  // บล็อก catch จะทำงานก็ต่อเมื่อใน try เกิด Error 
  catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } 
  // บล็อก finally จะทำงาน "เสมอ" ไม่ว่าข้างบนจะสำเร็จ try หรือพัง catch ก็ตาม
  finally {
    print('จบการทำงานรอบที่ 1 (ปิดการเชื่อมต่อเซิร์ฟเวอร์)\n');
  }


  print('--- ทดสอบกรณีที่ 2: ส่ง userId ที่ผิดพลาด (userId = 0) ---');
  try {
    print('กำลังโหลดข้อมูล...');
    var profile = await fetchProfile(0); // รอข้อมูล 2 วินาที
    // บรรทัดด้านล่างนี้จะ "ไม่ถูกทำงาน" เพราะโค้ดจะโยน Error บรรทัดบนแล้วเด้งไปเข้า catch ทันที
    print('โหลดข้อมูลสำเร็จ: $profile');
  } catch (e) {
    // รับ Exception ที่ถูก throw ออกมาแสดงผล
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    // สังเกตว่าแม้จะเกิด Error แต่ finally ก็ยังคงทำงานปกติ
    print('จบการทำงานรอบที่ 2 (ปิดการเชื่อมต่อเซิร์ฟเวอร์)');
  }
}
// สร้างฟังก์ชัน Stream
// ใช้คีย์เวิร์ด async* เพื่อบอกว่านี่คือฟังก์ชันที่จะทยอยส่งข้อมูลออกไปเป็น Stream
// ชนิดของ Stream เป็น <dynamic> เพราะเราจะส่งทั้งตัวเลข int และข้อความ String
Stream<dynamic> countdown(int from) async* {
  // วนลูปนับถอยหลังตั้งแต่ from จนถึง 0
  for (int i = from; i >= 0; i--) {
    // yield คือการ "ปล่อย" ข้อมูล 1 ชิ้นเข้าไปในสายพาน Stream
    yield i; 
    
    // หน่วงเวลา 1 วินาทีก่อนจะปล่อยรอบถัดไป
    await Future.delayed(Duration(seconds: 1));
  }
  
  // เมื่อลูปจบ ให้ปล่อยข้อความนี้เป็นชิ้นสุดท้าย
  yield 'หมดเวลา!';
}

void main() async {
  print('--- เริ่มจับเวลา ---');
  
  // การรับข้อมูลจาก Stream
  // ใช้โครงสร้าง await for เพื่อรอรับข้อมูลที่ทยอยไหลออกมาจากฟังก์ชัน countdown(5)
  // ลูปนี้จะทำงานสอดคล้องกับจังหวะเวลา 1 วินาที ที่ถูกกำหนดไว้ต้นทาง
  await for (var value in countdown(5)) {
    print(value);
  }
  
  print('--- จบการทำงาน ---');
}
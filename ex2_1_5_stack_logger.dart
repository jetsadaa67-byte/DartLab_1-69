// สร้าง Mixin
// Mixin เปรียบเสมือน ปลั๊กอิน ที่เราสามารถเอาไปเสียบให้คลาสไหนก็ได้
mixin Loggable {
  void log(String msg) {
    DateTime now = DateTime.now(); // ดึงเวลาปัจจุบันของเครื่อง
    print('[$now] $msg');
  }
}

// สร้างคลาส Stack แบบ Generics <T> 
// <T> ย่อมาจาก Type หมายความว่าตอนเอาไปใช้ ค่อยบอกอีกทีว่า Stack นี้จะเก็บข้อมูลชนิดไหน
// ใช้คำว่า with Loggable เพื่อดึงเอาความสามารถการพริ้นต์ Log มาใช้งาน
class Stack<T> with Loggable {
  // โครงสร้างภายในใช้ List<T> ในการจัดเก็บข้อมูลแบบ Private
  final List<T> _items = [];

  // เมธอด Push: เพิ่มข้อมูลต่อท้าย ด้านบนสุดของ Stack
  void push(T item) {
    _items.add(item);
    // เรียกใช้เมธอด log() ที่ได้มาจาก Mixin
    log('PUSH: เพิ่ม "$item" ลงใน Stack (จำนวนปัจจุบัน: ${_items.length})');
  }

  // เมธอด Pop: ดึงข้อมูลตัวล่าสุดออก Last-In, First-Out
  T? pop() {
    if (_items.isEmpty) {
      log('POP: ล้มเหลว! ไม่สามารถดึงข้อมูลได้เนื่องจาก Stack ว่างเปล่า');
      return null;
    }
    // removeLast() จะลบและส่งคืนค่าตัวสุดท้ายใน List ออกมาให้
    T removedItem = _items.removeLast();
    log('POP: ดึง "$removedItem" ออกจาก Stack (จำนวนเหลือ: ${_items.length})');
    return removedItem;
  }
}

void main() {
  print('--- ทดสอบ Stack สำหรับเก็บข้อความ (String) ---');
  // สร้าง Stack ที่ระบุว่า T คือ String
  Stack<String> bookStack = Stack<String>();
  bookStack.push('Harry Potter');
  bookStack.push('Dart for Beginners');
  bookStack.pop();

  print('\n--- ทดสอบ Stack สำหรับเก็บตัวเลข (int) ---');
  // สร้าง Stack ตัวเดิม แต่ระบุว่ารอบนี้ T คือ int
  Stack<int> numberStack = Stack<int>();
  numberStack.push(10);
  numberStack.push(20);
  numberStack.pop();
  numberStack.pop();
  numberStack.pop(); // ลองจำลองสถานการณ์ Pop ตอนที่ข้อมูลหมดแล้ว
}
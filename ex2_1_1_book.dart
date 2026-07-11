// สร้างคลาส Book 
class Book {
  // ฟิลด์ (Fields) สำหรับเก็บข้อมูล
  String title;
  String author;
  double price;

  // คอนสตรัคเตอร์ แบบย่อตามคำแนะนำ
  Book(this.title, this.author, this.price);

  // เมธอด สำหรับแสดงรายละเอียดของหนังสือ
  void showDetail() {
    print('ชื่อหนังสือ: $title');
    print('ผู้แต่ง: $author');
    print('ราคา: $price บาท');
    print('-------------------------');
  }
}

void main() {
  // สร้างอ็อบเจกต์ หนังสือ 2 เล่ม จากคลาส Book
  Book book1 = Book('แฮร์รี่ พอตเตอร์', 'J.K. Rowling', 495.0);
  Book book2 = Book('การเขียนโปรแกรม Dart เบื้องต้น', 'สมชาย ใจดี', 250.0);

  // เรียกใช้เมธอด showDetail() เพื่อแสดงผล
  print('--- รายละเอียดหนังสือ ---');
  book1.showDetail();
  book2.showDetail();
}
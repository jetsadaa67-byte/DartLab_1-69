class Temperature {
  // ฟิลด์ส่วนตัว การใส่เครื่องหมาย _ (Underscore) นำหน้า 
  //เป็นการบอกว่าตัวแปรนี้เป็น Private จะไม่สามารถเข้าถึงหรือแก้ไขจากภายนอกคลาสได้โดยตรง
   
  double _celsius = 0.0;

  // Getter สำหรับอ่านค่า _celsius
  double get celsius => _celsius;

  // Setter สำหรับกำหนดค่า _celsius พร้อมการตรวจสอบเงื่อนไข Validation
  set celsius(double value) {
    if (value < -273.15) {
      // หากค่าน้อยกว่าศูนย์สัมบูรณ์ ให้ปฏิเสธการตั้งค่าและแจ้งเตือน
      print('ข้อผิดพลาด: ปฏิเสธค่า! ไม่สามารถตั้งอุณหภูมิต่ำกว่า -273.15 °C ได้');
    } else {
      // หากค่าถูกต้อง ให้อัปเดตข้อมูลลงในฟิลด์
      _celsius = value;
    }
  }

  // Getter สำหรับดึงค่าอุณหภูมิในหน่วยฟาเรนไฮต์ 
  double get fahrenheit => (_celsius * 9 / 5) + 32;
}

void main() {
  print('--- ทดสอบระบบ Temperature ---');
  
  // สร้างอ็อบเจกต์
  Temperature temp = Temperature();

  // ทดสอบการตั้งค่าที่ถูกต้อง
  temp.celsius = 30.0; // เรียกใช้ Setter
  print('อุณหภูมิเซลเซียส: ${temp.celsius} °C'); // เรียกใช้ Getter celsius
  print('อุณหภูมิฟาเรนไฮต์: ${temp.fahrenheit} °F'); // เรียกใช้ Getter fahrenheit
  
  print('-----------------------------');

  // ทดสอบการตั้งค่าที่ผิดเงื่อนไข ต่ำกว่าศูนย์สัมบูรณ์
  print('ทดสอบตั้งค่าเป็น -300 °C:');
  temp.celsius = -300.0; // ระบบจะปฏิเสธค่านี้
  
  // ตรวจสอบค่าอุณหภูมิอีกครั้งเพื่อยืนยันว่าค่าไม่ถูกเปลี่ยน
  print('อุณหภูมิปัจจุบันยังคงเป็น: ${temp.celsius} °C');
}